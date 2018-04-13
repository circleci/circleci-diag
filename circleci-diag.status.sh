#!/usr/bin/env bash

# URL_GOOGLE="https://status.cloud.google.com/incidents.json" - Hard to extract
# URL_AWS="https://status.aws.amazon.com/data.json" -> Hard to extract
# URL_DOCKER="https://status.docker.com/pages/533c6539221ae15e3f000031/rss" -> Hard to extract
# URL_GH="https://status.github.com/api/status.json"
# URL_BB="https://bqlf8qjztdtr.statuspage.io/api/v2/status.json"

echo "Create status log directory"

mkdir status_logs

function pkg_statusAWS() {
  echo "Fetching Amazon status"
  curl https://status.aws.amazon.com/data.json -s >> ./status_logs/aws.json
}
