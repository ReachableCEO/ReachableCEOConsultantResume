#!/usr/bin/env bash


# This is a demo script for the MarkdownResumePipeline server
# This script creates PDF/MSWord output from markdown/csv input


############################################
#Edit this file to reflect your information
############################################

source "./CandidateVariables.env"

####################################################
####################################################
####################################################
#DO NOT CHANGE ANYTHING BELOW THIS LINE
####################################################
####################################################
####################################################

######################################################################################
# Setup key variables that will be used by the build-pipeline-server-markdown.sh script
######################################################################################

export BUILD_OUTPUT_DIR="$PipelineClientWorkingDir/build-output/JSONResume"
export JSON_TEMPLATE_DIRECTORY="$PipelineClientWorkingDir/Templates/JSONResume"

export JobBoardJSONOutputFile="$BUILD_OUTPUT_DIR/job-board/Candidate-Resume.json"
export ClientSubmissionJSONOutputFile="$BUILD_OUTPUT_DIR/client-submit/Candidate-Resume.json"

echo "Cleaning up from previous runs..."

rm $JobBoardJSONOutputFile
rm $ClientSubmissionJSONOutputFile

bash ../../vendor/git.knownelement.com/reachableceo/MarkdownResume-Pipeline/build/build-pipeline-server-json.sh  