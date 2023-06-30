#!/bin/sh

set -ex

cd -P -- "$(dirname -- "$0")"

curl https://www.gstatic.com/ipranges/cloud.json -o data/google-cloud.json
curl https://ip-ranges.amazonaws.com/ip-ranges.json -o data/aws.json
# Seriously?
curl -sf 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=56519' | grep -Eo 'href="https[^"]+ServiceTags_Public_[^"]+\.json\"' | head -n 1 | sed -e 's/href="//' -e 's/"$//' | xargs curl -o data/azure.json
