#!/bin/bash

# Default values
PROJECT_PATH="$(dirname "$0")"
INSTALL_PATH=$PROJECT_PATH
FORCE_INSTALL=false
VERSION_NUMBER="1.0.0"

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
    echo "  -f, --force             Force overwrite existing installation files (default: false)"
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
    echo "  -f, --force             Force overwrite existing installation files (default: false)"
    echo "                          This option specifies whether to overwrite existing installation files. If set to true, existing files will be overwritten. If set to false, installation will fail if any files already exist."
    echo ""
    echo "Examples:"
    echo "  # Install the dotfiles project in the default location"
    echo "  ./install.sh"
    echo ""
    echo "  # Install the dotfiles project in a custom location"
    echo "  ./install.sh --path /opt/dotfiles"
    echo ""
    echo "  # Overwrite existing installation files"
    echo "  ./install.sh --force"
    exit 0
    ;;
    -v|--version)
    log "SUCCESS"  "Profiles project version $VERSION_NUMBER"
    exit 0
    ;;
    -f|--force)
    FORCE_INSTALL=true
    shift
    ;;
    *)
    log "SUCCESS"  "Invalid option: $1"
    exit 1
    ;;
esac
done


# Copy installation files
log "SUCCESS" "Copying installation files to: $INSTALL_PATH"
if [ "$FORCE_INSTALL" = true ]
then
  echo 1;
else
  echo 2;
fi

# Set file permissions
log "SUCCESS" "Setting file permissions"

log "SUCCESS" "Installation completed successfully."

bash $PROJECT_PATH/src/checkers/zshChecker.sh || exit 1
bash $PROJECT_PATH/src/checkers/zshChecker.sh || exit 1




