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

if ! command which cat &>/dev/null; then
  >&2 echo 'cat command not found'
  exit 1
fi

if ! [[ -d "$PWD/.git/" ]]; then
  >&2 echo 'not found .git directory in your project'
  exit 1
fi

MSG=$(cat $PWD/.git/COMMIT_EDITMSG)
DEFAULT_REGEX_MSG="^(feat|fix|docs|style|refactor|test|chore|perf|other).*$"

while getopts "p:" arg; do
  case $arg in
    p) REGEX=$OPTARG;;
  esac
done

if typeset -p REGEX 2> /dev/null | grep -q '^'; then
  echo `typeset -p REGEX`
  echo '$var exists'
  FINAL_REGEX=`echo "${REGEX}" | sed -e "s/\'//g" | sed -e "s/\"//g" | sed -e "s/\=//g"`
fi

if ! [[ $MSG =~ ${FINAL_REGEX:-$DEFAULT_REGEX_MSG} ]]; then
  echo "Your commit msg was rejected due to messaging name"
  echo "Please rename your commit msg with ${FINAL_REGEX:-$DEFAULT_REGEX_MSG} syntax"
  exit 1
fi

exit 0