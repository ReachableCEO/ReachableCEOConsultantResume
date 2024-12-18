#!/bin/bash

# A client script to setup variables for and execute:
#../vendor/git.knownelement.com/reachableceo/MarkdownResume-Pipeline/build/build-pipeline-server.sh

source ./ConsultantVariables.env

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

# Cleanup previous intermediatge and final output artifacts

rm -vf $BUILD_TEMP_DIR/*.yml

rm -vf $BUILD_OUTPUT_DIR/*

# Call the build-pipeline-server in the vendored repository to produce updated output artifacts

bash ../../vendor/git.knownelement.com/reachableceo/ConsultantProfile-Pipeline-Server/build/build-pipeline-server-markdown.sh