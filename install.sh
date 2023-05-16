#!/bin/bash

source ./src/bootstrap/compile_boot.sh || exit 1

#echo $DOTFILES_BASE_PATH
VERSION_NUMBER="1.0.0"
IS_FORCE_INSTALLATION=false

import /src/utils/log.sh # import utils

# Parse command line options
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -h|--help)
      import /src/common/install/documentation.sh
      exit 0
    ;;
    -v|--version)
      log "SUCCESS"  "Profiles project version $VERSION_NUMBER"
      exit 0
    ;;
    -f|--force)
      IS_FORCE_INSTALLATION=true
      shift
    ;;
    *)
      log "SUCCESS"  "Invalid option: $1"
      exit 1
    ;;
esac
done

IS_INSTALL_LOG_PATH=$DOTFILES_BASE_PATH/src/runtime/logs/is_install_log.sh
if [ -f $IS_INSTALL_LOG_PATH ]  && [ $IS_FORCE_INSTALLATION != true ]; then
    log "ERROR" "The installation failed because the project has already been installed previously."
    exit 1;
fi

# Mark Installed
echo $(date +"%Y-%m-%d %T") > $IS_INSTALL_LOG_PATH

# To init before to insall
import /src/common/install/init.sh 

# To install all cli
import /src/common/install/install_all_cli.sh 

# Add bootstrap configuration.
import /src/common/install/to_push_config_to_env.sh

