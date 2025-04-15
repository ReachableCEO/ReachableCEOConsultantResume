#!/bin/bash

set -euo pipefail

if [ -f "D:/tsys/ReachableCEOPublic/MarketingMaterials/outputs/profile-consulting.reachableceo.com/CharlesNWyble-ConsultantProfile.pdf" ]; 
then
    rm -vf "D:/tsys/ReachableCEOPublic/MarketingMaterials/outputs/profile-consulting.reachableceo.com/CharlesNWyble-ConsultingProfile.pdf" 
fi

pandoc \
CharlesNWyble-ConsultantProfile.md \
--template "eisvogel" \
--metadata-file="./CharlesNWyble-ConsultantProfile.yml" \
--from markdown \
--to=pdf \
--output D:/tsys/ReachableCEOPublic/MarketingMaterials/outputs/profile-consulting.reachableceo.com/CharlesNWyble-ConsultantProfile.pdf