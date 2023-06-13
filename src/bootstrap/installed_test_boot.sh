#!/bin/sh
DOTFILES_BASE_PATH=$(pwd)
source ${DOTFILES_BASE_PATH}/src/utils/autoload.sh || exit 1 

import @/src/utils/color_printf.sh
import @/src/utils/helper.sh

# test_by_installed_state "installed"

