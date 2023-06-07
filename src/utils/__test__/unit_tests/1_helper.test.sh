#!/bin/bash

import /src/utils/helper.sh
import /src/utils/test_except.sh

# the demo testing
function get_all_sub_dir_by_path_test() {
  local runtimeDir="${DOTFILES_BASE_PATH}/src/runtime"
  local BASE_PATH="${runtimeDir}/get_all_sub_dir_by_path_test"
  local dir1="${BASE_PATH}/dir1"
  local dir2="${BASE_PATH}/dir2"
  mkdir -p $dir1
  mkdir -p $dir2
  local result=($(get_all_sub_dir_by_path "${BASE_PATH}"))
  except_str "${#result[@]}" '3'
  except_str "${result[0]}" 'dir1'
  except_str "${result[1]}" 'dir2'
}

# call hello_world_test() function，and pass the testing callback with the testing name and testing description.
handle_testing_callback "get_all_sub_dir_by_path_test" "Unit test src/utils/__test__/unit_tests/1_helper.test.sh"


