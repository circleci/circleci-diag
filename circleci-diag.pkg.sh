#!/usr/bin/env bash

# This env should have been set by a prior script
echo "The OS is $CIRCLECI_DIAG_OS"

if [ -n $CIRCLECI_DIAG_OS ]
then
  echo "The OS is $CIRCLECI_DIAG_OS"
  if [ $CIRCLECI_DIAG_OS == "Linux" ]
  then
    echo "foo"
    exit
  elif [ $CIRCLECI_DIAG_OS == "Darwin" ]
  then
    echo "bar"
    exit
  fi
else
  echo -e "Someone forgot to set the OS env\n"
fi