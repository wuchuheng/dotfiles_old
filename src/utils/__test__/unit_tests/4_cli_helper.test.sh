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

#+##
#+# Get the cache dir by cli name.
#+#
#+# @Use get_cache_dir 'zsh_cli'
#+# @Echo # echo string like /User/bar/dotfiles/src/runtime/cache/space_cache/zsh_cli
#+##
#+function get_cache_dir() {
function get_cache_dir_test() {
  local test_dir=$(get_full_path 'src/runtime/cache/space_cache/tmp_cli')
  if [ -d ${test_dir} ]; then
    rm -rf ${test_dir}
  fi
  local result=$(get_cache_dir 'tmp_cli')
  except_str "$test_dir" "${result}"
  local is_dir_created='false'
  if [ -d ${test_dir} ]; then
    is_dir_created='true'
  fi
  except_str "true" "${is_dir_created}"
}

handle_testing_callback "get_cache_dir_test" "Unit test get_cache_dir function"
