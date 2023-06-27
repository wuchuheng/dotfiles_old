#!/bin/bash

import @/src/utils/helper.sh

function to_install_zsh() {
  if ! is_command 'zsh'; then
    case "${GLOBAL_OS}" in
      'Ubuntu')
         sudo apt install -y zsh
      ;;
      'PRETTY_Ubuntu')
         sudo apt install -y zsh
      ;;
      'CentOS Linux')
         yum update -y;
         yum install -y zsh
      ;;
      'MacOS')
        brew update;
        brew install zsh
      ;;
    esac
  fi
  
  if ! is_command 'zsh'; then
    throw "zsh was not installed."
  fi
}


