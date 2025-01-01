#!/bin/bash

# Exit on error
set -e

# A client script to setup variables for and execute the consultant profile pipeline
# Executes: ../../vendor/git.knownelement.com/reachableceo/ConsultantProfile-Pipeline-Server/build/build-pipeline-server-markdown.sh

# Check if ConsultantVariables.env exists
if [ ! -f "./ConsultantVariables.env" ]; then
	echo "Error: ConsultantVariables.env not found"
	exit 1
fi

# Source the environment file with error handling
if ! source ./ConsultantVariables.env; then
	echo "Error: Failed to source ConsultantVariables.env. Please check the file for syntax errors."
	exit 1
fi

# Verify required environment variables
required_vars=("PipelineClientWorkingDir" "BUILD_OUTPUT_DIR")
for var in "${required_vars[@]}"; do
	if [ -z "${!var}" ]; then
		echo "Error: Required environment variable $var is not set"
		exit 1
	fi
done

####################################################
#DO NOT CHANGE ANYTHING BELOW THIS LINE
####################################################

##################################################################
# Setup globals for use by the build-pipeline-server.sh script
##################################################################

export MO_PATH="bash ../../vendor/git.knownelement.com/ExternalVendorCode/mo/mo"
export BUILD_TEMP_DIR="$PipelineClientWorkingDir/build-temp/ConsultantProfile"
export BUILDYAML_CONSULTANT_INFOSHEET="$BUILD_TEMP_DIR/ConsultantInfoSheet.yml"
export BUILDYAML_CONSULTANT_PROFILE="$BUILD_TEMP_DIR/ConsultantProfile.yml"

# Create necessary directories if they don't exist
mkdir -p "$BUILD_TEMP_DIR"
mkdir -p "$BUILD_OUTPUT_DIR"

# Cleanup previous intermediate and final output artifacts
rm -vf "$BUILD_TEMP_DIR"/*.yml
rm -vf "$BUILD_OUTPUT_DIR"/*

# Verify pipeline server script exists
PIPELINE_SERVER="../../vendor/git.knownelement.com/reachableceo/ConsultantProfile-Pipeline-Server/build/build-pipeline-server-markdown.sh"
if [ ! -f "$PIPELINE_SERVER" ]; then
	echo "Error: Pipeline server script not found at: $PIPELINE_SERVER"
	exit 1
fi

# Call the build-pipeline-server in the vendored repository to produce updated output artifacts
bash "$PIPELINE_SERVER"