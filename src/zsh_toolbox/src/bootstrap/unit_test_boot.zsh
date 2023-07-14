#!/usr/bin/env zsh

##
# The bootstrap for unit test.
#
# @User wuchuheng<root@wuchuheng.com>
# @Date 2023-07-14
##

# Declare a global variable in zsh while runtime for APP_PATH
typeset -g APP_BASE_PATH=$(pwd)
source ${APP_BASE_PATH}/src/utils/autoload.zsh || exit 1

