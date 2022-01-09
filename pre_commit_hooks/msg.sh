#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

DEBUG=${DEBUG:=0}

[[ "$DEBUG" = "1" ]] && set -o xtrace

# echo "Hello"
# MESSAGE=$(cat /Users/hieunlp/Desktop/DEV/pre-commit/test-branching.git/COMMIT_EDITMSG) 
# COMMITFORMAT="^(feat|fix|docs|style|refactor|test|chore|perf|other)(\((.*)\))?: #([0-9]+) (.*)$"



echo "$@"
# echo "$PWD"
echo "${MESSAGE}"

# while getopts "p:" arg; do
#   case $arg in
#     p) REGEX=$OPTARG;;
#   esac
# done

# if ! [[ $BRANCH =~ ${REGEX:-^(feat|fix|docs|style|refactor|test|chore|perf|other)(\((.*)\))?: #([0-9]+) (.*)$} ]]; then
#   echo "Your commit was rejected due to the commit message. Skipping..." 
#   echo ""
#   echo "Please use the following format:"
#   echo "feat: #1234 feature example comment"
#   echo "fix(ui): #4321 bugfix example comment"
#   echo ""
#   echo "More details on COMMITS.md"
#   exit 1
# fi

# exit 0