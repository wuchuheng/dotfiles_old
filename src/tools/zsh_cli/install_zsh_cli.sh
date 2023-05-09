#!/bin/sh

# 检测当前操作系统类型
os_type=$(uname)

# 判断操作系统类型
if [ "$os_type" = "Linux" ]; then
    cat /etc/os-release
elif [ "$os_type" = "centos" ] || [ "$os_type" = "rhel" ]; then
    echo "CentOS/RHEL"
elif [ "$os_type" = "Darwin" ]; then
    echo "MacOS"
else
    echo "Unknown"
fi
echo $os_type

