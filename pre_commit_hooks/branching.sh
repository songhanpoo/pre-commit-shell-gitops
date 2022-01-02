#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
BRANCH=$(git rev-parse --abbrev-ref HEAD)
REGEX="^(dev|release)-([0-9]+)-q([0-9]+)\.([0-9]+)\.(.+)$"

DEBUG=${DEBUG:=0}
[[ "$DEBUG" = "1" ]] && set -o xtrace

if ! command which git &>/dev/null; then
  >&2 echo 'git command not found'
  exit 1
fi


if ! [[ $BRANCH =~ $REGEX ]]; then
  echo "$@"
  echo "Your commit was rejected due to branching name"
  echo "Please rename your branch with '(dev|release)-YYYY-qX.X.X' syntax"
  exit 1
fi