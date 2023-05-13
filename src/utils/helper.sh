#!/bin/bash

source $DOTFILES_BASE_PATH/src/utils/log.sh || exit 1

function print_call_stack() {
  local frame=0
  while caller $frame; do
    ((frame++))
  done
}

import() {
  local RED='\033[0;31m'
  local NC='\033[0m'
  local timestamp=$(date +"%Y-%m-%d %T")
  source_file=$DOTFILES_BASE_PATH$1
  source "$source_file";
  if [ $? != 0 ]; then
    IFS=' ' read -r -a parts <<< $(caller 0)
    printf "${RED}✖ ${timestamp} %s: line %s: %s ${NC} \n" ${parts[2]} ${parts[0]} "Failed to load $source_file, the file not found."
    exit 1
  fi
}
