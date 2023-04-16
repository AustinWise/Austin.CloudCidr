#!/bin/sh

set -ex

cd -P -- "$(dirname -- "$0")"

curl https://www.gstatic.com/ipranges/cloud.json -o data/google-cloud.json
curl https://ip-ranges.amazonaws.com/ip-ranges.json -o data/aws.json
curl https://download.microsoft.com/download/7/1/D/71D86715-5596-4529-9B13-DA13A5DE5B63/ServiceTags_Public_20230410.json -o data/azure.json
