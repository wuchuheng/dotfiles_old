#!/bin/bash

import @/src/utils/test_except.sh
import @/src/utils/cli_helper.sh

function get_cli_number_by_cli_name_with_number_test() {
  local result=$(get_cli_number_by_cli_name_with_number '1_zsh_cli')
  
  except_str "1" "${result}"

}

handle_testing_callback "get_cli_number_by_cli_name_with_number_test" "Unit test get_cli_number_by_cli_name_with_number function"

function get_cli_name_by_cli_name_with_number_test() {
  local result=$(get_cli_name_by_cli_name_with_number '1_zsh_cli')
  
  except_str "zsh_cli" "${result}"

}

handle_testing_callback "get_cli_name_by_cli_name_with_number_test" "Unit test get_cli_name_by_cli_name_with_number function"
