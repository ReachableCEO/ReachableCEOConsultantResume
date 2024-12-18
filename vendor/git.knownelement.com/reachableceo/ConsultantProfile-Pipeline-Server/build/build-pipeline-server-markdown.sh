#!/usr/bin/env bash

set -euo pipefail

#####################################################################################################
#Markdown to PDF Consultant information sheet and profile
#####################################################################################################

#############################################
# Create the consultant information PDF
#############################################

# Expand variables into rendered YAML files. These will be used by pandoc to create the output artifacts

#$MO_PATH $YamlInputTemplateFileConsultantInfoSheet > $BUILDYAML_CONSULTANT_INFOSHEET

echo "Creating candidate info sheet..."

echo "MO Path: $MO_PATH"

set -x

$MO_PATH $PipelineClientWorkingDir/Templates/CounsultantInfoSheet.md

$MO_PATH $PipelineClientWorkingDir/Templates/CounsultantInfoSheet.md > "$ConsultantInfoSheetMarkdownOutputFile"

set +x

#pandoc \
#"$ConsultantInfoSheetMarkdownOutputFile" \
#--template $PANDOC_TEMPLATE \
#--metadata-file="$BUILDYAML_CONSULTANT_INFOSHEET" \
#--from markdown \
#--to=pdf \
#--output $ConsultantInfoSheetPDFOutputFile

#############################################
# Create the consultant profile PDF
#############################################

# Coming later
