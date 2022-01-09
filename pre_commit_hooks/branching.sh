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
DEFAULT_REGEX_BRANCH="^(dev|release).*$"

while getopts "p:" arg; do
  case $arg in
    p) REGEX=$OPTARG;;
  esac
done
# echo "$@"

if typeset -p REGEX 2> /dev/null | grep -q '^'; then
  echo `typeset -p REGEX`
  echo '$var exists'
  FINAL_REGEX=`echo "${REGEX}" | sed -e "s/\'//g" | sed -e "s/\"//g" | sed -e "s/\=//g"`
fi

if ! [[ $BRANCH =~ ${FINAL_REGEX:-$DEFAULT_REGEX_BRANCH} ]]; then
  echo "Your commit was rejected due to branching name"
  echo "Please rename your branch with ${FINAL_REGEX:-$DEFAULT_REGEX_BRANCH} syntax"
  exit 1
fi

exit 0