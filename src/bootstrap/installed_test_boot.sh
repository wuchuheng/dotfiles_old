#!/bin/bash
DOTFILES_BASE_PATH=$(pwd)
source ${DOTFILES_BASE_PATH}/src/utils/autoload.sh || exit 1

import @/src/handlers/test_handler.sh
import @/src/utils/helper.sh

all_test_dir=(
src/cli/1_zsh_cli
)

all_test_files=()
for test_dir in ${all_test_dir[@]}; do
  all_test_files+=($(get_test_files "${test_dir}" 'installed_tests'))
done

test_handle "${all_test_files}"

