#!/bin/bash

import @/src/utils/helper.sh

##
# Get the number from cli name
#
# @Use get_cli_number_by_cli_name_with_number '1_zsh_cli'
# @Echo 1
##
function get_cli_number_by_cli_name_with_number() {
  local cli_name=$1;
  local cli_info=($(split_str "$cli_name" "_"))
  local cli_info_len=${#cli_info[@]}
  ((cli_info_len--))
  local cli_number=${cli_info[0]}
  
  echo ${cli_number}
}

##
# Get the cli name from cli name include number
#
# @Use get_cli_name_by_cli_name_with_number '1_zsh_cli'
# @Echo 'zsh_cli'
##
function get_cli_name_by_cli_name_with_number() {
  local cli_name=$1;
  local cli_info=($(split_str "$cli_name" "_"))
  local cli_info_len=${#cli_info[@]}
  cli_name=''
  for (( i=1; i < cli_info_len; i++   )); do
      cli_name+="_${cli_info[$i]}"
  done
  cli_name=${cli_name:1}
  
  echo "${cli_name}"
}

##
# Get the cache dir by cli name.
#
# @Use get_cache_dir 'zsh_cli'
# @Echo # echo string like /User/bar/dotfiles/src/runtime/cache/space_cache/zsh_cli
##
function get_cache_dir() {
  local cli_name=$1
  local relative_path="src/runtime/cache/space_cache/${cli_name}"
  local full_path=$(get_full_path "${relative_path}")
  if [ ! -d ${full_path} ]; then
     mkdir -p "${full_path}"
  fi

  echo "${full_path}"
}

