#!/bin/bash

source $DOTFILES_BASE_PATH/src/utils/log.sh || exit 1

function print_call_stack() {
  local frame=0
  while caller $frame; do
    ((frame++))
  done
}

import() {
  local RED='\033[0;31m'
  local NC='\033[0m'
  local timestamp=$(date +"%Y-%m-%d %T")
  source_file=$DOTFILES_BASE_PATH$1
  source "$source_file";
  if [ $? != 0 ]; then
    IFS=' ' read -r -a parts <<< $(caller 0)
    printf "${RED}✖ ${timestamp} %s: line %s: %s ${NC} \n" ${parts[2]} ${parts[0]} "Failed to load $source_file, the file not found."
    exit 1
  fi
}


##
# get_all_cli_directory_in_cli_path # print the list of elements from cli path.
##
get_all_cli_directory_in_cli_path() {
  local cli_dir_list=()
  cli_path=$DOTFILES_BASE_PATH/src/cli
  for directory in "$cli_path"/*/; do
    if [[ -d "$directory" ]]; then
      directory=${directory:0:${#directory} - 1}
      last_directory_name=${directory//$cli_path\//}
      cli_dir_list+=($last_directory_name)
    fi
  done

  echo "${cli_dir_list[@]}"
}


##
# 在cli目录中获取最大的数值编号
# max_number=$(($(get_max_number_in_cli_path)))
# echo $max_number # out put a numeric value.
##
get_max_number_in_cli_path() {
  local max_number=0
  cli_dir_list=$(get_all_cli_directory_in_cli_path)
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

##
# 获取用于载入环境变量的提供者文件
#
##
get_cli_to_env_provider_by_cli_directory_name(){
  IFS="_" read -ra parts <<< "$1"
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
    # $1: Full path
    # $2: Number of parent directories to remove (optional, default is 0)

    local full_path="$1"
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
        subpath+="/${path_parts[i + 1]}"
    done

    # Print the subpath
    echo "$subpath"
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
  if [ $1 == $2 ];then
    is_ok=1
  fi
  test_name="test_name:${TEST_NAME}"
  if [ ${is_ok} == 1 ];then
    # printf "$(bg_green_print " PASS ") ${current_file}:${line} $test_name \n"
    return 0
  else
    printf "$(bg_red_print " FAIL ") ${current_file}:${line}\n"
    printf "    $(pink_print '●') $(pink_print "${TEST_NAME}")\n"
    printf "    Expected: $(green_print $1)\n"
    printf "    Received: $(red_print $2)\n\n"
    is_pass=1
    return 1
  fi
}


