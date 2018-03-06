#!/usr/bin/env bash

# Get OS
export CIRCLECI_DIAG_OS="$(uname -s)"
echo "The OS is $($CIRCLECI_DIAG_OS)"

BASE=$(basename $filename .sh)

echo "My name is $BASE"