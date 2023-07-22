#!/usr/bin/env zsh

## declare a const variable of APP_PATH by pwd command
declare -g APP_BASE_PATH=$(pwd)
source ${APP_BASE_PATH}/src/utils/autoload.zsh || exit 1

import @/src/utils/helper.zsh
import @/src/utils/log.zsh

echo ${APP_BASE_PATH}/src/runtime
get_max_number_file_by_path ${APP_BASE_PATH}/src/utils/__test__/unit_tests