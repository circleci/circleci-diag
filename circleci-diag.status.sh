#!/usr/bin/env bash

# URL_GOOGLE="https://status.cloud.google.com/incidents.json" - Hard to extract
# URL_AWS="https://status.aws.amazon.com/data.json" -> Hard to extract
# URL_DOCKER="https://status.docker.com/pages/533c6539221ae15e3f000031/rss" -> Hard to extract
# URL_GH="https://status.github.com/api/status.json"
# URL_BB="https://bqlf8qjztdtr.statuspage.io/api/v2/status.json"

#init
AWS_COUNT="0"

#result
RESULT_AWS=
RESULT_GOOGLE=
RESULT_GH=
RESULT_BB=

echo "Create status log directory"
mkdir -p status_logs

function status_AWS() {
  curl -s https://status.aws.amazon.com/data.json | ./JSON.sh | grep "\[\"current\"\]" > ./status_logs/aws.json
  AWS_COUNT=$(echo ./status_logs/aws.json | wc -c )
  if [[ $AWS_COUNT == "23" ]]; then
    RESULT_AWS="GOOD"
  else
    RESULT_AWS="BAD"
  fi
}

function status_Google() {
  TODAY_DATE=$(date +%Y-%m-%d)
  curl -s https://status.cloud.google.com/incidents.json | ./JSON.sh > ./status_logs/google.json

  GOOGLE_DATE=$(head -n 1 ./status_logs/google.json | grep -o "[0-9]...-[0-9].-[0-9].")

  if [[ $TODAY_DATE == $GOOGLE_DATE ]]; then
    RESULT_GOOGLE="BAD"
  else
    RESULT_GOOGLE="GOOD"
  fi

}

function status_GH() {
  GH_STATUS=$(curl -s https://status.github.com/api/status.json | ./JSON.sh | head -n 1 | grep -o "good")

  if [[ $GH_STATUS != "good" ]]; then
    RESULT_GH="BAD"
  else
    RESULT_GH="GOOD"
  fi

}

function status_BB() {
  BB_STATUS_STRING="description\":\"All Systems Operational"
  BB_STATUS=$(curl -s https://bqlf8qjztdtr.statuspage.io/api/v2/status.json | ./JSON.sh | tail -n 1 | grep -o "description\":\"All Systems Operational")
  if [[ $BB_STATUS != $BB_STATUS_STRING ]]; then
    RESULT_BB="BAD"
  else
    RESULT_BB="GOOD"
  fi

}


status_AWS
status_Google
status_GH
status_BB

echo "AWS Status " $RESULT_AWS
echo "Google Status " $RESULT_GOOGLE
echo "GitHub Status " $RESULT_GH
echo "BitBucket Status " $RESULT_BB
