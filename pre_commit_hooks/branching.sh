#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

DEBUG=${DEBUG:=0}

[[ "$DEBUG" = "1" ]] && set -o xtrace

if ! command which git &>/dev/null; then
  >&2 echo 'git command not found'
  exit 1
fi

BRANCH=$(git rev-parse --abbrev-ref HEAD)


while getopts "p:" arg; do
  case $arg in
    p) REGEX=$OPTARG;;
  esac
done

if ! [[ $BRANCH =~ ${REGEX:-^(dev|release)-([0-9]+)-q([0-9]+)\.([0-9]+)\.(.+)$} ]]; then
  echo "Your commit was rejected due to branching name"
  echo "Please rename your branch with ${REGEX} syntax"
  exit 1
fi