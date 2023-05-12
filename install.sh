#!/bin/bash

# Default values
PROJECT_PATH=$(pwd)
INSTALL_PATH=$PROJECT_PATH
FORCE_INSTALL=false
VERSION_NUMBER="1.0.0"
IS_INSTALL=true
IS_FORCE_INSTALLATION=false

# import utils
source $PROJECT_PATH/src/utils/log.sh

# To init
source $PROJECT_PATH/src/common/install/init.sh

# Parse command line options
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -h|--help)
      source $PROJECT_PATH/src/common/install/documentation.sh
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

PROJECT_PATH_LOG_PATH=$PROJECT_PATH/src/runtime/logs/project_path_log.sh
IS_INSTALL_LOG_PATH=$PROJECT_PATH/src/runtime/logs/is_install_log.sh

if [ -f $IS_INSTALL_LOG_PATH ]  && [ $IS_FORCE_INSTALLATION != true ]; then
    log "ERROR" "The installation failed because the project has already been installed previously."
    exit 1;
fi

# To install all tools
source $PROJECT_PATH/src/common/install/install_tools.sh

# Add bootstrap configuration.
source $PROJECT_PATH/src/common/install/to_push_config_to_env.sh

echo "PROJECT_PATH=${PROJECT_PATH}" > $PROJECT_PATH_LOG_PATH 
echo $(date +"%Y-%m-%d %T") > $IS_INSTALL_LOG_PATH 

