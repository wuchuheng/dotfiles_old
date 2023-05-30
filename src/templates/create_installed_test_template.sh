#!/bin/bash

source src/bootstrap/compile_boot.sh || exit 1
import /src/utils/log.sh
import /src/utils/color_printf.sh

read -p "$(green_print 'Please enter a testing file name you want to create: ')" INSTALLED_TEST_FILE

BASE_DIR=$(get_directory "${INSTALLED_TEST_FILE}")

BASE_DIR=${DOTFILES_BASE_PATH}/src/${BASE_DIR}/__test__/installed_tests

if [ ! -d ${BASE_DIR} ];then
  mkdir -p ${BASE_DIR}
fi

setopt KSH_ARRAYS >/dev/null 2>&1
path_info=($(split_str "${INSTALLED_TEST_FILE}" '/'))
readonly FILE_NAME=${path_info[${#path_info[@]} - 1]}
relative_path=${BASE_DIR:${#DOTFILES_BASE_PATH}}
log 'INFO'  "${relative_path}"
max_number=$(get_max_number_by_path  ${relative_path})

echo "${max_number}"

echo $BASE_DIR


