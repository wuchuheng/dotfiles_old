#!/bin/bash

import ../../test_except.sh
import ../../color_printf.sh

function bg_green_print_test() {
  local result=`bg_green_print hello`
  except_value='[1m[0;30m[42mhello[0m'
  except_str "${result}" "${except_value}"
}

handle_testing_callback "bg_green_print_test" "Test bg_green_print_test function."

function bold_print_test() {
  local BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  local result=`bold_print hello`
  except_value='\e[1mhello\e[0m'
  except_str "${except_value}" "${result}" 
}

handle_testing_callback "bold_print_test" "Test bold_print_test function."

