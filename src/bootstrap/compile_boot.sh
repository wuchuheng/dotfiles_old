#!/bin/bash

DOTFILES_BASE_PATH=$(pwd)
source ${DOTFILES_BASE_PATH}/src/utils/autoload.sh || exit 1
# to declare the base path for the dotfiles project.
DOTFILES_BASE_PATH_LOG=${DOTFILES_BASE_PATH}/src/runtime/compile_path_log
if [ ! -d $DOTFILES_BASE_PATH_LOG ]; then
    mkdir -p $DOTFILES_BASE_PATH_LOG
fi

# to init the runtime directory.
LOGS_PATH="${DOTFILES_BASE_PATH}/src/runtime/logs"
if [ ! -e $LOGS_PATH ]; then
    mkdir -p $LOGS_PATH;
fi

source $DOTFILES_BASE_PATH/src/utils/helper.sh || exit 1

