#!/bin/bash
DOTFILES_BASE_PATH=$(pwd)
source ${DOTFILES_BASE_PATH}/src/utils/autoload.sh || exit 1

import @/src/handlers/test_handler.sh
import @/src/config/unit_test_conf.sh

test_handle "${ALL_UNIT_TEST_FILES[@]}"

