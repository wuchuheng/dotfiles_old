#!/bin/bash

DOTFILES_BASE_PATH=$(pwd)
source $DOTFILES_BASE_PATH/src/utils/helper.sh || exit 1

test_by_installed_state "uninstalled"

