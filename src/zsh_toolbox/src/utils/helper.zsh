#!/usr/bin/env zsh

##
# get_all_sub_dir_by_path # print the list of elements from cli path.
#
# @Use get_all_sub_dir_by_path "/foo/bar"
# @Echo ("sub_path1", "sub_path2", "sub_path3")
##
function get_all_sub_dir_by_path() {
  local local_path=$1
  local sub_dir_list=($(ls -l $local_path | awk '/^d/ {print $NF}'))
  echo ${sub_dir_list[@]}
}


##
# Split a string by a symbol
#
# @desc split_str "hello world" " "
# @return ("hello" "world")
##
function split_str() {
  local str=$1
  local symbol=$2
  local array=("${=str//${symbol}/ }")
  echo ${array[@]}
}