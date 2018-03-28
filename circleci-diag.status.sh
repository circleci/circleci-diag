#!/usr/bin/env bash

# URL_GOOGLE="https://status.cloud.google.com/incidents.json" - Hard to extract
# URL_AWS="https://status.aws.amazon.com/data.json" -> Hard to extract
# URL_DOCKER="https://status.docker.com/pages/533c6539221ae15e3f000031/rss" -> Hard to extract
# URL_GH="https://status.github.com/api/status.json"
# URL_BB="https://bqlf8qjztdtr.statuspage.io/api/v2/status.json"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function chk_Github() {
  GH_STATUS=$(curl -s https://status.github.com/api/status.json | awk -F '"' '{print $4}')
  if [[ $GH_STATUS == "good" ]]; then
    echo "${GREEN}Good${NC}"
  else
    echo ${RED}${GH_STATUS}${NC}
  fi
  
}

function chk_Bitbucket() {
  BB_STATUS=$(curl -s https://bqlf8qjztdtr.statuspage.io/api/v2/status.json | awk -F '"' '{print $24}')
  if [[ $BB_STATUS == "none" ]]; then
    echo "${GREEN}Good${NC}"
  else
    echo ${RED}${BB_STATUS}${NC}
  fi
  
}


function chk_Bintray() {
  BT_STATUS=$(curl -s http://1n9tx3q75973.statuspage.io/api/v2/summary.json | awk -F '"' '{print $416}')
  if [[ $BT_STATUS == "none" ]]; then
    echo "${GREEN}Good${NC}"
  else
    echo ${RED}${BT_STATUS}${NC}
  fi
  
}


echo "Querying Github"
chk_Github
echo "Querying BitBucket"
chk_Bitbucket
echo "Querying Bintray"
chk_Bintray
