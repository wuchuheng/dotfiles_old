#!/bin/bash

CURRENT_FILE_PATH="$(dirname $0)"

# source $CURRENT_FILE_PATH/colors_printf.sh

# 定义颜色常量
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# 定义图标常量
INFO_ICON="ℹ"
SUCCESS_ICON="✔"
WARNING_ICON="⚠"
ERROR_ICON="✖"

##
# To log the message.
#
# @Use log [INFO|SUCCESS|WARNING|ERROR]
# @Echo #string
#
log() {
  local level="$1"
  local message="$2"
  local script="${BASH_SOURCE[1]}"
  local line="${BASH_LINENO[0]}"
  local timestamp=$(date +"%Y-%m-%d %T")

  case "$level" in
    "INFO")
      printf "${INFO_ICON} %s [%s:%d] %s\n" "$timestamp" "$script" "$line" "$message"
      ;;
    "SUCCESS")
      success_string=$( printf "${GREEN} ${SUCCESS_ICON} %s [%s:%d] %s ${NC}\n" "$timestamp" "$script" "$line" "$message")
      echo $success_string
      ;;
    "WARNING")
      printf "${YELLOW}${WARNING_ICON} %s [%s:%d] %s${NC}\n" "$timestamp" "$script" "$line" "$message"
      ;;
    "ERROR")
      printf "${RED}${ERROR_ICON} %s [%s:%d] %s${NC}\n" "$timestamp" "$script" "$line" "$message"
      ;;
    *)
      printf "${NC}${message}\n"
      ;;
  esac
}

# 输出日志信息
# log "INFO" "Starting installation..."
# log "SUCCESS" "Installation completed successfully."
# log "WARNING" "Some configuration files may have been overwritten."
# log "ERROR" "Installation failed. Aborting." 

