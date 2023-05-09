#!/bin/bash

# Default values
PROJECT_PATH="$(dirname "$0")"
INSTALL_PATH=$PROJECT_PATH
FORCE_INSTALL=false
VERSION_NUMBER="1.0.0"
IS_INSTALL=true

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
    *)
    log "SUCCESS"  "Invalid option: $1"
    exit 1
    ;;
esac
done

bash $PROJECT_PATH/src/checkers/zshChecker.sh || exit 1
bash $PROJECT_PATH/src/tools/send_email_notification_cli/install_check_send_email_notifcation_cli.sh || exit 1
bash $PROJECT_PATH/src/tools/git_cli/check_is_exist_git_cli.sh || exit 1

