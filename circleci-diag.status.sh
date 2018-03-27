#!/bin/bash
# URL_GOOGLE="https://status.cloud.google.com/incidents.json" - Hard to extract
# URL_AWS="https://status.aws.amazon.com/data.json" -> Hard to extract
# URL_DOCKER="https://status.docker.com/pages/533c6539221ae15e3f000031/rss" -> Hard to extract
# URL_GH="https://status.github.com/api/status.json"
# URL_BB="https://bqlf8qjztdtr.statuspage.io/api/v2/status.json"

function chk_Github() {
  GH_STATUS=$(curl -s https://status.github.com/api/status.json | awk -F '"' '{print $4}')
  if [[ $GH_STATUS == "good" ]]; then
    echo 'good'
  else
    echo 'bad'
  fi
  
}

function chk_Bitbucket() {
  BB_STATUS=$(curl -s https://bqlf8qjztdtr.statuspage.io/api/v2/status.json | awk -F '"' '{print $24}')
  if [[ $BB_STATUS == "none" ]]; then
    echo 'good'
  else
    echo $BB_STATUS
  fi
  
}


function chk_Bintray() {
  BT_STATUS=$(curl -s http://1n9tx3q75973.statuspage.io/api/v2/summary.json | awk -F '"' '{print $416}')
  #BINTRAY CURRENTLY EXPERIENCING OUTAGE. NOT SURE WHAT GOOD INDICATOR IS ATM
  if [[ $BT_STATUS == "good" ]]; then
    echo 'good'
  else
    echo $BT_STATUS
  fi
  
}

echo "Querying Github"
chk_Github
echo "Querying BitBucket"
chk_Bitbucket
echo "Querying Bintray"
chk_Bintray
echo "Querying AWS"