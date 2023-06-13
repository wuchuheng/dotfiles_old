#!/bin/bash

import ../../test_except.sh
import ../../color_printf.sh

function bg_green_print_test() {
  local result=$(bg_green_print ' hello ')
  except_value='[1m[0;30m[42m hello [0m'
  except_str "${result}" "${except_value}"
}

handle_testing_callback "bg_green_print_test" "Test bg_green_print_test function."

function bold_print_test() {
  local result=`bold_print hello`
  except_value='[1mhello[0m'
  except_str "${except_value}" "${result}" 
}

handle_testing_callback "bold_print_test" "Test bold_print_test function."

function bg_red_print_test() {
  local result=`bg_red_print hello`
  local except_value='[1m[0;30m[41mhello[0m'
  except_str "${except_value}" "${result}"
}

handle_testing_callback "bg_red_print_test" "Test bg_red_print function."

function back_print_test() {
  local result=`back_print 'hello'`
  local except_value='[0;30mhello[0m'
  except_str "$except_value" "${result}"
}

handle_testing_callback "back_print_test" "Test back_print function."

function pink_print_test() {
  local result=`pink_print 'hello'`
  local except_value='[38;2;225;113;104mhello[0m'
  except_str "${except_value}" "${result}"
}

handle_testing_callback "pink_print_test" "Test pink_print function."

function green_print_test() {
  local BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  local result=`green_print 'green_print'`
  cat > ${BASE_PATH}/tmp.log << EOF
${result}
EOF
  local except_value='[0;32mgreen_print[0m'
  except_str "${except_value}" "${result}"
}

handle_testing_callback "green_print_test" "Test green_print function."

function yellow_print_test() {
  local BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  local result=$(yellow_print 'yellow_print')
  cat > ${BASE_PATH}/tmp.log << EOF
${result}
EOF
  local except_value='[0;33myellow_print[0m'
  except_str "$except_value" "$result"
}

handle_testing_callback "yellow_print_test" "test yellow_print function."

function blue_print_test() {
  local BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  local result=$(blue_print 'blue_print')
  cat > ${BASE_PATH}/tmp.log << EOF
${result}
EOF
  local except_value='[0;34mblue_print[0m'
  except_str "${except_value}" "${result}"
}

handle_testing_callback "blue_print_test" "test blue_print function."

function red_print_test() {
  local BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  local result=$(red_print 'red_print')
  cat > ${BASE_PATH}/tmp.log << EOF
${result}
EOF
  local except_value='[0;31mred_print[0m'
  except_str "${except_value}" "${result}"
}

handle_testing_callback "red_print_test" "test red_print function."
