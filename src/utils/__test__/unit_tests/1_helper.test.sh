##
# The unit test file for helper.sh .
#
# @Author wuchuheng<root@wuchuheng.com>
# @Date 2023-06-08
##

#!/bin/bash

import /src/utils/helper.sh
import /src/utils/test_except.sh

# the demo testing
function get_all_sub_dir_by_path_test() {
  local BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  local dir1="${BASE_PATH}/dir1"
  local dir2="${BASE_PATH}/dir2"
  mkdir -p $dir1
  mkdir -p $dir2
  local result=($(get_all_sub_dir_by_path "${BASE_PATH}"))
  except_str "${#result[@]}" '2'
  except_str "${result[0]}" 'dir1'
  except_str "${result[1]}" 'dir2'
}

# call hello_world_test() function，and pass the testing callback with the testing name and testing description.
handle_testing_callback "get_all_sub_dir_by_path_test" "Test if you can get all the subdirectories unser a specifc path"


function get_a_part_of_code_test() {
  local BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  local test_file=${BASE_PATH}/code_for_test.txt
  cat > ${test_file} << EOF
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
EOF
  result=$(get_a_part_of_code ${test_file} 10)
  local except_value="    5  | 5
    6  | 6
    7  | 7
    8  | 8
    9  | 9
 [0;31m[1m->[0m 10 | 10
    11 | 11
    12 | 12
    13 | 13
    14 | 14
    15 | 15"
  log_file=${BASE_PATH}/log.txt
  except_str  "${result}" "${except_value}"
}

handle_testing_callback "get_a_part_of_code_test" "To test to get a part of conrent frome a file with a file path and a number line."

function get_all_file_by_path_test() {
  local BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  rm -rf ${BASE_PATH}/*;
  local file1=${BASE_PATH}/file1;
  local file2=${BASE_PATH}/file2;
  local dir=${BASE_PATH}/dir1;
  touch $file1 $file2
  mkdir -p $dir
  local all_file=($(get_all_file_by_path ${BASE_PATH}))
  except_str ${#all_file[@]} 2
  except_str ${all_file[0]} "file1"
  except_str ${all_file[1]} "file2"
}

handle_testing_callback "get_all_file_by_path_test" "To test get_all_file_by_path function" 

function get_max_number_file_by_path_test() {
  local BASE_PATH=`get_runtime_space_by_unit_test_name ${global_test_name}`
  touch ${BASE_PATH}/{1,2,3,4}_file
  local result=`get_max_number_file_by_path ${BASE_PATH}`
  except_str $result 4
}
handle_testing_callback "get_max_number_file_by_path_test" "To test get_max_number_file_by_path function" 

function get_zsh_start_symbol_test() {
  local result=$(get_zsh_start_symbol "tmp")
  except_str "$result" '#To load tmp, start'
}

handle_testing_callback "get_zsh_start_symbol_test" "To test get_zsh_start_symbol function" 

function get_zsh_end_symbol_test() {
  local result=$(get_zsh_end_symbol "tmp")
  except_str "$result" '#To load tmp, end'
}

handle_testing_callback "get_zsh_end_symbol_test" "To test get_zsh_end_symbol function" 

function get_main_sh_path_test() {
  local result=`get_main_sh_path`
  except_str "$result" '/src/main.sh'
}

handle_testing_callback "get_main_sh_path_test" "To test get_main_sh_path function" 

function get_full_path_test() {
  local result=$(get_full_path "tmp")
  except_str "$result" "${DOTFILES_BASE_PATH}/tmp"
}

handle_testing_callback "get_full_path_test" "To test get_full_path function" 
