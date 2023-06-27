#!/bin/bash

import @/src/utils/log.sh

function install_git_success_log() {
   log 'INFO' "The git installation successfully" 
}

if ! is_command 'git'; then
  case "${GLOBAL_OS}" in
    'Ubuntu')
       sudo apt install -y git
       if $? == 0; then
         install_git_success_log
       fi
    ;;
    'PRETTY_Ubuntu')
       sudo apt install -y git
       if $? == 0; then
         install_git_success_log
       fi
    ;;
    'CentOS Linux')
       yum update -y;
       yum install -y git
       if $? == 0; then
         install_git_success_log
       fi
    ;;
    'MacOS')
      brew update;
      brew install git
       if $? == 0; then
         install_git_success_log
       fi
    ;;
  esac
fi

if ! is_command 'git'; then
  throw "Git was not installed."
fi
