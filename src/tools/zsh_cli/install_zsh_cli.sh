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
    sudo apt update && sudo apt install zsh -y && successLog
elif [ "$OS_TYPE" = "centos" ] || [ "$OS_TYPE" = "rhel" ]; then
    # CentOS 8 
    minorver=8.5.2111
    sed -e "s|^mirrorlist=|#mirrorlist=|g" \
             -e "s|^#baseurl=http://mirror.centos.org/\$contentdir/\$releasever|baseurl=https://mirrors.aliyun.com/centos-vault/$minorver|g" \
             -i.bak \
         /etc/yum.repos.d/CentOS-*.repo
    yum makecache    
    yum update -y && yum install -y zsh && successLog
elif [ "$OS_TYPE" = "Darwin" ]; then
    brew install zsh && successLog;
else
    echo "Unknown"
fi

