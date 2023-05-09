#!/bin/sh

# 检测当前操作系统类型
if [ -f /etc/os-release ]; then
    . /etc/os-release
    os_type=$ID
else
    os_type=$(uname)
fi

# 判断操作系统类型
if [ "$os_type" = "debian" ] || [ "$os_type" = "ubuntu" ]; then
    echo "Debian/Ubuntu"
elif [ "$os_type" = "centos" ] || [ "$os_type" = "rhel" ]; then
    echo "CentOS/RHEL"
elif [ "$os_type" = "Darwin" ]; then
    echo "MacOS"
else
    echo "Unknown"
fi
echo $os_type

