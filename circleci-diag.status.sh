#!/usr/bin/env bash

# URL_GOOGLE="https://status.cloud.google.com/incidents.json" - Hard to extract
# URL_AWS="https://status.aws.amazon.com/data.json" -> Hard to extract
# URL_DOCKER="https://status.docker.com/pages/533c6539221ae15e3f000031/rss" -> Hard to extract
# URL_GH="https://status.github.com/api/status.json"
# URL_BB="https://bqlf8qjztdtr.statuspage.io/api/v2/status.json"

echo "Create status log directory"

mkdir -p status_logs

# function status_AWS() {
#   echo "Fetching Amazon status"
#   curl -s https://status.aws.amazon.com/data.json | ./JSON.sh > ./status_logs/aws.json
#   echo "Amazon status saved"
#   grep "\[\"current\"\]" ./status_logs/aws.json
# }

function status_AWS() {
  echo "Fetching Amazon status"
  curl -s https://status.aws.amazon.com/data.json | ./JSON.sh | grep "\[\"current\"\]" > ./status_logs/aws.json
  AWS_COUNT=$(echo ./status_logs/aws.json | wc -c )

if [[ $AWS_COUNT == "23" ]]; then
  echo "AWS is Good"
else
  echo "AWS is Experiencing issues"
fi
}

function status_Google() {
  echo "Fetching Google status"
  curl -s https://status.cloud.google.com/incidents.json | ./JSON.sh > ./status_logs/google.json
}


status_AWS
status_Google