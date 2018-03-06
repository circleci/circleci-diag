#!/usr/bin/env bash



# This function runs if the OS is Linux
function pkg_linux() {
  dpkg -l
  exit
}

# This function runs if the OS is Darwin
function pkg_darwin() {
  brew list --versions
  exit
}

#==========================================

# This env should have been set by a prior script
if [ -n $CIRCLECI_DIAG_OS ]
then
  echo "The OS is $CIRCLECI_DIAG_OS"
  if [ $CIRCLECI_DIAG_OS == "Linux" ]
  then
    pkg_linux
  elif [ $CIRCLECI_DIAG_OS == "Darwin" ]
  then
    pkg_darwin
  fi
else
  echo -e "Someone forgot to set the OS env\n"
fi