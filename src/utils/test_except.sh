#!/bin/bash

import /src/utils/helper.sh

##
# 断言字符
# except_string "excepted str" "received str"
##
function except_str() {
  local prefix_path_len=${#DOTFILES_BASE_PATH}
  ((prefix_path_len++))
  local test_file=${BASH_SOURCE[1]}
  current_file=${test_file:${prefix_path_len}}
  local line="${BASH_LINENO[0]}"
  local is_ok=0
  if [ "$1" == "$2" ];then
    is_ok=1
  fi
  test_name="test_name:${TEST_NAME}"
  if [ ${is_ok} == 1 ];then
    # printf "$(bg_green_print " PASS ") ${current_file}:${line} $test_name \n"
    return 0
  else
    printf "$(bg_red_print " FAIL ") ${current_file}:${line}\n"
    printf "    $(pink_print '●') $(pink_print "${TEST_NAME}")\n"
    printf "    Expected: $(green_print "$1")\n"
    printf "    Received: $(red_print "$2")\n\n"
    get_a_part_of_code ${current_file} ${line}
    global_is_pass=1
    return 1
  fi
}
