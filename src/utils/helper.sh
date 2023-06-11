#!/bin/bash

import /src/utils/log.sh
import /src/utils/color_printf.sh

##
# get_all_sub_dir_by_path # print the list of elements from cli path.
# @call get_all_sub_dir_by_path "/foo/bar"
# @echo ("sub_path1", "sub_path2", "sub_path3")
##
get_all_sub_dir_by_path() {
  local cli_dir_list=()
  cli_path=$1
  for directory in "$cli_path"/*/; do
    if [[ -d "$directory" ]]; then
      directory=${directory:0:${#directory} - 1}
      last_directory_name=${directory//$cli_path\//}
      cli_dir_list+=($last_directory_name)
    fi
  done

  echo ${cli_dir_list[@]}
}


##
# @desc 获取一个文件1-10行内容
# @use  get_a_part_of_code "/Users/wuchuheng/dotfiles/tmp.sh" 5
# @return 
#
#    1  | readonly ALL_UNIT_TEST_FILES=(
#    2  | utils/__test__/unit_tests/1_helper.test.sh
#    3  | utils/__test__/unit_tests/2_helper.test.sh
#    4  | utils/__test__/unit_tests/3_helper.test.sh
# -> 5  | utils/__test__/unit_tests/4_helper.test.sh
#    6  | utils/__test__/unit_tests/5_helper.test.sh
#    7  | utils/__test__/unit_tests/6_helper.test.sh
#    8  | utils/__test__/unit_tests/7_helper.test.sh
#    9  | utils/__test__/unit_tests/8_helper.test.sh
#    10 | utils/__test__/unit_tests/9_helper.test.sh
#    11 | utils/__test__/unit_tests/10_helper.test.sh
#
##
get_a_part_of_code() {
  local file=$1
  local lineNumber=$2;
  local allLine=$(wc -l ${file} | awk '{print $1}')
  local intervalWidth=5 # 区间宽度
  local intervalStart=$lineNumber # 区间开始坐标
  local intervalEnd=$lineNumber # 区间结始坐标
  for (( i=1; i <= 5; i++ )); do
    if ((((intervalStart - 1)) > 0)) ; then
      ((intervalStart--))
    else
      ((intervalEnd++))
    fi
    if (( ((intervalEnd + 1)) <= ${allLine} )); then
      ((intervalEnd++))
    else
      ((intervalStart--))
    fi
  done
  local result=`sed -n "${intervalStart},${intervalEnd}p" $file`
  local cln=${intervalStart}
  local lineNumberWidth=${#intervalEnd}
  while IFS= read -r line; do
    if (( cln == lineNumber )); then
      printf " \033[0;31m\033[1m->\e[0m %-${lineNumberWidth}s | $line\n" $cln
    else
      printf "    %-${lineNumberWidth}s | $line\n" $cln
    fi
    ((cln++))
  done <<< "$result"
}

##
# get_all_file_by_path # print the list of elements from cli path.
# get_all_file_by_path "/foo/bar"
# @echo ("file1", "file1", "file3")
##
get_all_file_by_path() {
  local file_list=()
  local readonly path=$1
  for file in "$path"/*; do
    if [[ -f "$file" ]]; then
      last_file_name=${file//$path\//}
      file_list+=($last_file_name)
    fi
  done

  echo ${file_list[@]}
}


##
# 在目录中获取文件列表中最大的数值编号
# max_number=$(($(get_max_number_file_by_path "/foo/bar")))
# echo $max_number # out put a numeric value.
##
get_max_number_file_by_path() {
  local max_number=0
  file_list=($(get_all_file_by_path $1))
  for file in ${file_list[@]}; do
    IFS="_" read -ra parts <<< "$file"
    number=$((${parts[0]}))
    if [ $number -gt $max_number ];then
      max_number=$number
    fi
  done
  
  echo $max_number;
}


##
# 在cli目录中获取最大的数值编号
# max_number=$(($(get_max_number_by_path "/foo/bar")))
# echo $max_number # out put a numeric value.
##
get_max_number_by_path() {
  local max_number=0
  cli_dir_list=$(get_all_sub_dir_by_path $1)
  for directory in ${cli_dir_list[@]}; do
    IFS="_" read -ra parts <<< "$directory"
    number=$((${parts[0]}))
    if [ $number -gt $max_number ];then
      max_number=$number
    fi
  done
  
  echo $max_number;
}

##
# 获取一个开始识别标识记号
#
##
get_zsh_start_symbol(){
  echo "#To load $1, start"
}

##
# 获取一个结束识别标识记号
#
##
get_zsh_end_symbol(){
  echo "#To load $1, end"
}

##
# 获取入口bash文件
#
##
get_main_sh_path(){
  echo "/src/main.sh"
}

##
# 获取绝对路径
#
##
get_full_path(){
  first_char="${1:0:1}"
  splic_symbol=""
  if [ $first_char != '/' ]; then
    splic_symbol="/"
  fi
  echo "${DOTFILES_BASE_PATH}${splic_symbol}$1"
}


is_zsh() {
  if [ -n "$ZSH_VERSION" ]; then
    echo 0
  else
    echo 1
  fi
}

##
# 分割字串为数组
#
# @desc split_str "hello world" " "
# @return ("hello" "world")
##
split_str() {
  local string="$1"
  local delimiter="$2"
  local array=()
  local is_zsh_result=`is_zsh`
  if (( is_zsh_result == '0' )); then
    setopt KSH_ARRAYS
    array=("${=string//${delimiter}/ }")
  else
    IFS="${delimiter}"
    read -ra array <<< "${string}"
  fi
  echo "${array[@]}"
}

##
# 获取用于载入环境变量的提供者文件
#
# @use  get_cli_to_env_provider_by_cli_directory_name 19_hello_cli
# @echo /src/cli/1_git/load_git_to_zsh_env_provider.sh
##
get_cli_to_env_provider_by_cli_directory_name(){
  local directory=$1;
  setopt KSH_ARRAYS >/dev/null 2>&1
  result=($(split_str "${directory}" "_"))
  local parts=($(split_str "$1" "_" ))
  local number=${parts[0]}
  number=$((${#number} + 1))
  local cli_name="${directory:$number}"

  echo "/src/cli/${parts[0]}_${cli_name}/load_${cli_name}_to_zsh_env_provider.sh"
}

##
# 获取目录
#
# get_directory "/1/2/3/4/5" 1
# @return "/1/2/3/4"
##
get_directory() {
    local full_path="$1"
    full_path=$(echo "$full_path" | sed 's/\/*\//\//g')
    last_character="${full_path: -1}"
    if [ ${last_character} == '/' ];then
     full_path=${full_path:0:(${#full_path} - 1)}
    fi
    local subpath=""
    # Remove trailing slash (if any)
    full_path="${full_path%/}"

    # Split the path into an array
    IFS="/" read -ra path_parts <<< "$full_path"

    # Determine the starting index for the subpath
    local start_index=${2:-1}
    # Concatenate the subpath from the path parts
    for ((i = 0; i < ${#path_parts[@]} - ${start_index}; i++)); do
        subpath+="${path_parts[i]}/"
    done

    # Print the subpath
    echo "${subpath:0:(${#subpath} - 1)}"
}

##
# 获取一个目录下的全部文件
# @use get_files_by_path "/path"
# @return ("file1" "file2")
#
get_files_by_path() {
  local path=$1;
  local files=`find "$path" -type f`
  local file_list=()
  while read -r file; do
    file_list+=("${file}")
  done <<< "$files"
  echo ${file_list[@]}
}

##
# 执行测试
# test_by_installed_state "installed" # OR "uninstalled"
#
##
function test_by_installed_state() {
  import /src/config/test_conf.sh
  local argument1="$1"
  is_all_pass=0
  total_tests=0
  total_pass=0
  total_fail=0
  startTimestamp=$(date +%s)
  local state=""
  if [ ${argument1} == 'installed' ];then
     state='installed'
  elif [ ${argument1} == 'uninstalled' ];then
     state='uninstalled'
  else
    log "ERROR" "The parameter ${argument1} passed in is not 'installed' or 'uninstalled'"
    exit 1
  fi
  for element in "${TEST_DIR[@]}"; do
    local base_path="$(get_full_path $element)/__test__/${state}_tests"
    local files=($(get_files_by_path ${base_path}))
    for file in "${files[@]}"; do
      ((total_tests++))
      is_pass=0
      source "${base_path}/${file}" 
      if [ $is_pass -eq 0 ];then
        printf "$(bg_green_print " PASS ") ${file}\n"
        ((total_pass++))
      else
        ((total_fail++))
        echo "${base_path}/${file}"
        is_all_pass=1
      fi
    done
  done

  endTimestamp=$(date +%s )
  durationTime=$((endTimestamp - startTimestamp ))
  echo ""
  printf "$(bold_print 'Tests:')      $(red_print ${total_fail}) $(red_print 'failed'), $(green_print "${total_pass}" $BOLD) $(green_print 'passed'), %d total\n" ${total_tests}
  printf "$(bold_print 'Time:')        ${durationTime} s\n"
  printf "Ran all test suites.\n"
  if [ ${is_all_pass} != 0 ]; then
    ((global_total_fail++))
    printf "$(red_print 'Test failed. See above for more details')\n"
  else
    ((global_total_pass++))
  fi
}

# Declare the function with two propters: the callback contained a testing logic, the testing name and the testing description.
function handle_testing_callback() {
    local callback="$1" # the callback function contained a testing logic
    global_test_name="$1"
    global_test_desc="$2"
    global_start_timestamp=$(date +%s)
    global_duration=0; # Units/second
    global_is_pass=0
    "$callback"
    if (( global_is_pass != 0 )); then
      global_test_file_is_pass=1
      ((global_total_fail++))
    else
      ((global_total_pass++))
      global_pass_test_desc_items+=("${global_test_desc}")
      global_pass_test_name_items+=("${global_test_name}")
      local test_name_len=${#global_test_name}
      if (( test_name_len > global_max_pass_tests_len )); then
        global_max_pass_tests_len=$test_name_len
      fi
    fi	
    ((global_total_tests++))
    global_duration=$(expr $(date +%s) - ${global_start_timestamp})
}

##
# To get a runtime space while to run a test.
#
# @use result=get_runtime_space_by_unit_test_name "get_a_part_of_code_test" 
# @use printf $result # /Users/wuchuheng/dotfiles/src/runtime/test/get_a_part_of_code_test 
##
function get_runtime_space_by_unit_test_name() {
  local test_name=$1
  local runtimeDir="${DOTFILES_BASE_PATH}/src/runtime"
  local BASE_PATH="${runtimeDir}/test/unit_test/${test_name}"
  if [ ! -d ${BASE_PATH} ]; then
    mkdir -p ${BASE_PATH}
  fi
  printf ${BASE_PATH} 
}


