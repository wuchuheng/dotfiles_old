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

# Parse command line options
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -h|--help)
      echo "Usage: ./install.sh [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  -h, --help              Display this help message and exit"
      echo "  -v, --version           Display the version number and exit"
      echo "  -p, --path PATH         Set the installation path for dotfiles project (default: $INSTALL_PATH/dotfile)"
      echo ""
      echo "Description:"
      echo "  The install.sh script is used to install the dotfiles project on your system. It supports the following options:"
      echo ""
      echo "  -h, --help              Display this help message and exit"
      echo "                          This option displays the help message for the install.sh script."
      echo ""
      echo "  -v, --version           Display the version number and exit"
      echo "                          This option displays the version number of the dotfiles project."
      echo ""
      echo "  -p, --path PATH         Set the installation path for dotfiles project (default: $INSTALL_PATH/dotfiles)"
      echo "                          This option sets the installation path for the dotfiles project. If the specified path does not exist, it will be created."
      echo ""
      echo "  -f, --force             Forced Installation."
      echo ""
      echo "Examples:"
      echo "  # Install the dotfiles project in the default location"
      echo "  ./install.sh"
      echo ""
      echo "  # Install the dotfiles project in a custom location"
      echo "  ./install.sh --path /opt/dotfiles"
      echo ""
      echo "  # Overwrite existing installation files"
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

bash $PROJECT_PATH/src/checkers/zshChecker.sh || exit 1
bash $PROJECT_PATH/src/tools/send_email_notification_cli/install_check_send_email_notifcation_cli.sh || exit 1
bash $PROJECT_PATH/src/tools/git_cli/check_is_exist_git_cli.sh || exit 1

MAIN_FILE_PATH="${PROJECT_PATH}/src/main.sh"
isloadBashrc=$(cat ~/.bashrc | grep "$MAIN_FILE_PATH")
if [ "$isloadBashrc" == '' ]; then
  log "INFO" "To load the main.sh to ~/.zshrc"
  echo "" >>~/.zshrc 
  echo "# Dotfiles start" >>~/.zshrc 
  echo "if [ -e "$MAIN_FILE_PATH" ];then" >>~/.zshrc
  echo "    source $MAIN_FILE_PATH;" >>~/.zshrc
  echo "fi" >>~/.zshrc
  echo "# Dotfiles end" >>~/.zshrc 
  echo "" >>~/.zshrc 
  zsh
  source ~/.zshrc
fi

echo "PROJECT_PATH=${PROJECT_PATH}" > $PROJECT_PATH_LOG_PATH 
echo $(date +"%Y-%m-%d %T") > $IS_INSTALL_LOG_PATH 

