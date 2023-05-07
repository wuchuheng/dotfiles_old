#!/bin/sh

CURRENT_FILE_PATH="$(dirname $0)"

source $CURRENT_FILE_PATH/../../checkers/commandChecker.sh
source $CURRENT_FILE_PATH/../../utils/log.sh

if ! check_command mail; then
  log "ERROR" "Your system has not installed mail yet, please install mail before proceeding to the next step."
  exit 1;
fi



