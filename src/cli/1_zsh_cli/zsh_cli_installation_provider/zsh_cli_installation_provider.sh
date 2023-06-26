#!/bin/bash

import @/src/utils/helper.sh

if ! is_command 'zsh'; then
  case "${GLOBAL_OS}" in
    'Ubuntu')
       apt update -y;
       apt install -y zsh
    ;;
    'PRETTY_Ubuntu')
       apt update -y;
       apt install -y zsh
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

