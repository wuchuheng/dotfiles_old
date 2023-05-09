#!/bin/sh
CURRENT_FILE_PATH="$(dirname $0)"

source $CURRENT_FILE_PATH/../../checkers/commandChecker.sh
source $CURRENT_FILE_PATH/../../utils/log.sh


# 检测当前操作系统类型
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_TYPE=$ID
else
    OS_TYPE=$(uname)
fi

log "INFO" "The OS is $OS_TYPE"

successLog() {
  log "SUCCESS" "The zsh be installed."
  zsh --version
}


# 判断操作系统类型
if [ "$OS_TYPE" = "debian" ] || [ "$OS_TYPE" = "ubuntu" ]; then
    sudo apt update;
    sudo apt install zsh -y;
    successLog
elif [ "$OS_TYPE" = "centos" ] || [ "$OS_TYPE" = "rhel" ]; then
    echo "CentOS/RHEL"
elif [ "$OS_TYPE" = "Darwin" ]; then
    brew install zsh;
    successLog;
else
    echo "Unknown"
fi

