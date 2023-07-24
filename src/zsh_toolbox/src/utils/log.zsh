#!/usr/bin/env zsh

# Function to get the terminal width
function get_terminal_width() {
  local terminal_width=$(tput cols)
  echo "$terminal_width"
}

##
# Function to get the actual width of a string
#
# @Use get_actual_width "hello"
# @Echo 5
###
function get_actual_width() {
  local string="$1"
  local width=$(echo -E "$string" | wc -c)
  echo "$width"
}

##
# To log the message.
#
# @Use log [INFO|SUCCESS|WARNING|ERROR]
# @Echo #string
#
function log() {
  # 定义颜色常量
  local RED='\033[0;31m'
  local GREEN='\033[0;32m'
  local YELLOW='\033[0;33m'
  local BLUE='\033[0;34m'
  local NC='\033[0m'
  # 定义图标常量
  local INFO_ICON="ℹ"
  local SUCCESS_ICON="✔"
  local WARNING_ICON="⚠"
  local ERROR_ICON="✖"
  local level="$1"
  local message="$2"
  local timestamp=$(date +"%T")
  local file_number=${funcfiletrace[1]}
  local right_msg="${timestamp} ${file_number}"
  local terminal_width=$(get_terminal_width)
  local function infoPrint() {
      local left_msg="$@"
      local left_str_len=$(get_actual_width "${@}")
      local symbol="INFO:"
      local right_str_len=$(( ${#file_number} + ${#timestamp} + 2 + 1 + ${#symbol} ))
      local left_str_space=$(( $terminal_width - $right_str_len ))
      if [[ $left_str_len -le $left_str_space ]]; then
        printf  "\033[0;32m\033[1m${symbol}\033[0m %-${left_str_space}s \033[2m%s\033[0m\n" "${left_msg}" "${right_msg}"
      else
        printf  "\033[0;32m\033[1m${symbol}\033[0m %s \033[1;30m%s\033[0m\n" "${left_msg}" "${right_msg}"
      fi
  }
  local function successPrint() {
      local left_msg="$@"
      local left_str_len=$(get_actual_width "${left_msg}")
      local sequierCharacterWidth=$((${left_str_len} - ${#left_msg}))
      local symbol="SUCCESS:"
      local wide_len=$( ${APP_BASE_PATH}/src/vendor/convert_str_width_in_terminal/bin/convert_str_width_in_terminal "${left_msg}" )
      local addition_wide_str_width=$(( ${wide_len} - ${#left_msg} ))
      local right_str_len=$(( ${#file_number} + ${#timestamp} + 2 + 1 + ${addition_wide_str_width}  + ${#symbol} ))
      local left_str_space=$(( $terminal_width - $right_str_len ))
      if [[ $left_str_len -le $left_str_space ]]; then
        printf  "\033[0;32m\033[1m${symbol}\033[0m %-${left_str_space}s \033[2m%s\033[0m\n" "${left_msg}" "${right_msg}"
      else
        printf  "\033[0;32m\033[1m${symbol}\033[0m %s \033[1;30m%s\033[0m\n" "${left_msg}" "${right_msg}"
      fi
  }

  case "$level" in
    "INFO")
      infoPrint "$@"
      ;;
    "SUCCESS")
       successPrint "${message}"
      ;;
    "WARNING")
      printf "${YELLOW}${WARNING_ICON} %s %s %s${NC}\n" "$timestamp" "$message"
      ;;
    "ERROR")
      local left_msg="\033[0;31m\033m[1mERROR\033[0m $message"
      local right_msg="${timestamp} ${file_number}"
      echo "${left_msg} ${right_msg}"
      ;;
    *)
      infoPrint "$@"
      ;;
  esac
}

# 输出日志信息
# log "INFO" "Starting installation..."
# log "SUCCESS" "Installation completed successfully."
# log "WARNING" "Some configuration files may have been overwritten."
# log "ERROR" "Installation failed. Aborting." 

