#!/bin/bash

# to declare the base path for the dotfiles project.
DOTFILES_BASE_PATH_LOG=$(pwd)/src/runtime/compile_path_log/base_path_log.sh
if [ ! -f $DOTFILES_BASE_PATH_LOG ]; then
    mkdir -p $(dirname $DOTFILES_BASE_PATH_LOG)
    cat > $DOTFILES_BASE_PATH_LOG  << EOF
#!/bin/bash
DOTFILES_BASE_PATH=$(pwd)
EOF
fi

source $DOTFILES_BASE_PATH_LOG || exit 1
# to init the runtime directory.
LOGS_PATH="${DOTFILES_BASE_PATH}/src/runtime/logs"
if [ ! -e $LOGS_PATH ]; then
    mkdir -p $LOGS_PATH;
fi


source $DOTFILES_BASE_PATH/src/utils/helper.sh || exit 1

