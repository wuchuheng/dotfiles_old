#!/bin/sh

DOTFILES_BASE_PATH=$(pwd)
source $DOTFILES_BASE_PATH/src/utils/helper.sh || exit 1
import /src/utils/color_printf.sh

test_by_installed_state "installed"

