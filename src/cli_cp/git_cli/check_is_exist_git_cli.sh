#!/bin/sh

CURRENT_FILE_PATH="$(dirname $0)"

source $CURRENT_FILE_PATH/../../checkers/commandChecker.sh
source $CURRENT_FILE_PATH/../../utils/log.sh

log "INFO" "To check the git exists before to install."

if ! check_command git; then
  log "ERROR" "Your system has not installed git yet, please install git before proceeding to the next step."
  exit 1;
fi
