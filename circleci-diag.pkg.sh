#!/usr/bin/env bash


function pkg_yarn() {

if ! foobar_loc="$(type -p "yarn")" || [[ -z $foobar_loc ]]; then
  echo "no yarn"
else
  echo "checking yarn"
  yarn --version
  yarn global list || yarn global ls
fi

}

function pkg_npm() {

if ! foobar_loc="$(type -p "npm")" || [[ -z $foobar_loc ]]; then
  echo "no npm"
else
  echo "checking npm"
  npm --version
  npm ls --global
fi

}

# This function runs if the OS is Linux
function pkg_linux() {
  dpkg -l
}

# This function runs if the OS is Darwin
function pkg_darwin() {
  brew list --versions
}

#==========================================

# This env should have been set by a prior script
if [ -n $CIRCLECI_DIAG_OS ]
then
  echo "The OS is $CIRCLECI_DIAG_OS"
  if [ $CIRCLECI_DIAG_OS == "Linux" ]
  then
    pkg_linux
    pkg_yarn
    pkg_npm

  elif [ $CIRCLECI_DIAG_OS == "Darwin" ]
  then
    pkg_darwin
    pkg_yarn
    pkg_npm
  fi
else
  echo -e "Someone forgot to set the OS env\n"
fi

