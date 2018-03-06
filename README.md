# circleci-diag

[![CircleCI](https://circleci.com/gh/circleci/circleci-diag.svg?style=shield&circle-token=95ea032aa1784dce6e43162fe42f2d4340acae2f)](https://circleci.com/gh/circleci/circleci-diag)

Bash script to run diag commands in a build

## Supported OS

Uses `uname -s` to fetch OS

* Linux
* Darwin

## Modules

### OS

* Runs `ps aux` on both Darwin and Linux

### Package

* Runs `dpkg -l` on Linux
* Runs `brew list --versions` on Darwin

