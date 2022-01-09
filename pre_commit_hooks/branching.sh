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
# echo "$@"


# echo "${REGEX}" | sed -e "s/\'//g" | sed -e "s/\"//g" | sed -e "s/\=//g"
FINAL_REGEX=`echo "${REGEX}" | sed -e "s/\'//g" | sed -e "s/\"//g" | sed -e "s/\=//g"`

echo "$PWD"
echo "${FINAL_REGEX}"

if ! [[ $BRANCH =~ ${FINAL_REGEX:-^(dev|release).*$} ]]; then
  echo "${FINAL_REGEX}"
  echo "Your commit was rejected due to branching name"
  echo "Please rename your branch with ${FINAL_REGEX} syntax"
  exit 1
fi

exit 0