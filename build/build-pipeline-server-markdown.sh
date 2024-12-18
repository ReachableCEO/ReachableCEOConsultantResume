#!/usr/bin/env bash

set -euo pipefail

#####################################################################################################
#Markdown to PDF Consultant information sheet and profile
#####################################################################################################

#############################################
# Create the consultant information PDF
#############################################

# Expand variables into rendered YAML files. These will be used by pandoc to create the output artifacts

$MO_PATH $YamlInputTemplateFileConsultantInfoSheet > $BUILDYAML_CONSULTANT_INFOSHEET

echo "Creating candidate info sheet..."

echo "Profile file name: $PROFILE_FILE_NAME"

set -x

export ConsultantInfoSheetMarkdownOutputFile="$BUILD_OUTPUT_DIR/$PROFILE_FILE_NAME-ConsultantInfoSheet.md"
export ConsultantInfoSheetPDFOutputFile="$BUILD_OUTPUT_DIR/$PROFILE_FILE_NAME-ConsultantInfoSheet.pdf"

$MO_PATH $PipelineClientWorkingDir/Templates/CounsultantInfoSheet.md > "$ConsultantInfoSheetMarkdownOutputFile"

pandoc \
"$ConsultantInfoSheetMarkdownOutputFile" \
--template $PANDOC_TEMPLATE \
--metadata-file="$BUILDYAML_CONSULTANT_INFOSHEET" \
--from markdown \
--to=pdf \
--output $ConsultantInfoSheetPDFOutputFile

#############################################
# Create the consultant profile PDF
#############################################

# Coming later
