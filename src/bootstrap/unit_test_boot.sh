#!/bin/bash
DOTFILES_BASE_PATH=$(pwd)
source ${DOTFILES_BASE_PATH}/src/utils/autoload.sh || exit 1

import @/src/handlers/test_handler.sh
import @/src/config/test_conf.sh

all_test_files=()
for test_dir in ${ALL_TEST_DIR}; do
  all_test_files+=($(get_test_files "${test_dir}" 'unit_tests'))
done

test_handle "${all_test_files[@]}"

