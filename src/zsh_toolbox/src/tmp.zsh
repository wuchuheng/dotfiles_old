#!/usr/bin/env zsh

## declare a const variable of APP_PATH by pwd command
declare -g APP_BASE_PATH=$(pwd)
source ${APP_BASE_PATH}/src/utils/autoload.zsh || exit 1

import @/src/utils/helper.zsh

get_all_sub_dir_by_path "${APP_BASE_PATH}"

result=($(split_str "hello world" " "))
echo ${#result[@]}
