#!/usr/bin/env bash

# Get OS
export CIRCLECI_DIAG_OS=$(uname -s)
echo "The OS is $CIRCLECI_DIAG_OS"

BASE=$(basename ${0##*/} .sh)

echo "My name is $BASE"

echo "I have found the following modules:"
for f in $BASE.*.sh
do
	echo "Located module $f"

  # Can we just run the modules?
  ./$f

  # Add some linebreaks between modules
  echo ""
  echo ""
  echo ""
done