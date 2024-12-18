#!/usr/bin/env bash

set -euo pipefail

#####################################################################################################
#Markdown to PDF Consultant information sheet and profile
#####################################################################################################

#############################################
# Create the consultant information PDF
#############################################

# Expand variables into rendered YAML files. These will be used by pandoc to create the output artifacts

echo "Creating consultant info sheet..."

$MO_PATH $YamlInputTemplateFileConsultantInfoSheet > $BUILDYAML_CONSULTANT_INFOSHEET
$MO_PATH $PipelineClientWorkingDir/Templates/ConsultantInfoSheet.md > "$ConsultantInfoSheetMarkdownOutputFile"

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

echo "Creating consultant profile..."

$MO_PATH $YamlInputTemplateFileConsultantProfile > $BUILDYAML_CONSULTANT_PROFILE

#############################################################################
# Logic to create the consultant profile markdown output file goes here
# (...)
#############################################################################

$MO_PATH $PipelineClientWorkingDir/Templates/ConsultantProfile.md > "$ConsultantProfileMarkdownOutputFile"


pandoc \
"$ConsultantProfileMarkdownOutputFile" \
--template $PANDOC_TEMPLATE \
--metadata-file="$BUILDYAML_CONSULTANT_PROFILE" \
--from markdown \
--to=pdf \
--output $ConsultantProfilePDFOutputFile