#!/bin/bash

import /src/utils/log.sh

function print_call_stack() {
  local frame=0
  while caller $frame; do
    ((frame++))
  done
}


##
# get_all_sub_dir_by_path # print the list of elements from cli path.
# get_all_sub_dir_by_path "/foo/bar"
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
# get_all_sub_dir_by_path # print the list of elements from cli path.
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
      return 0
  else
      return 1
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
  if is_zsh; then
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
##
get_cli_to_env_provider_by_cli_directory_name(){
  local directory=$1;
  if is_zsh; then
    setopt KSH_ARRAYS
  fi
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
    local parent_count="${2:-0}"
    local subpath=""
    # Remove trailing slash (if any)
    full_path="${full_path%/}"

    # Split the path into an array
    IFS="/" read -ra path_parts <<< "$full_path"

    # Determine the starting index for the subpath
    local start_index=$((parent_count + 1))

    # Concatenate the subpath from the path parts
    for ((i = 0; i < ${#path_parts[@]} - ${start_index}; i++)); do
        subpath+="${path_parts[i]}/"
    done

    # Print the subpath
    echo "${subpath:0:(${#subpath} - 1)}"
}

##
# 获取一个目录下的全部文件
# @return ("file1" "file2")
#
get_files_by_path() {
  local file_list=()
  path="$1"
  local fil_list=$(ls -l  $1 | awk 'NR > 1  {print $9}')
  while IFS= read -r line; do
    IFS="_" read -ra parts <<< "$line"
    number=$((${parts[0]}))
    file_list[$number]=$line
  done <<< "${fil_list}"
  echo "${file_list[@]}"
}

##
# 断言字符
# except_string "excepted str" "received str"
##
except_str() {
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
    is_pass=1
    return 1
  fi
}

import /src/utils/color_printf.sh


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
    printf "$(red_print 'Test failed. See above for more details')\n"
  fi
}

# Declare the function with two propters: the callback contained a testing logic, the testing name and the testing description.
function handle_testing_callback() {
    local callback="$1" # the callback function contained a testing logic
    global_test_name="$2"
    global_test_desc="$3"
    global_start_timestamp=$(date +%s)
    global_duration=0; # Units/second
    "$callback"
    global_duration=$(expr $(date +%s) - ${global_start_timestamp})
}

