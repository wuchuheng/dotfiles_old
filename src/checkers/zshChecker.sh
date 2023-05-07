#!/bin/bash

CURRENT_FILE_PATH="$(dirname "$0")"

source  $CURRENT_FILE_PATH/../utils/log.sh
source  $CURRENT_FILE_PATH/../utils/checkCommand.sh

if ! check_command zshh ; then
   log "ERROR" "Your system has not installed zsh yet, please install zsh before proceeding to the next step."
   exit 1
fi

