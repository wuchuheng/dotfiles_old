#!/bin/bash

if ! is_command 'git'; then
  case "${GLOBAL_OS}" in
    'Ubuntu')
       sudo apt install -y git
    ;;
    'PRETTY_Ubuntu')
       sudo apt install -y git
    ;;
    'CentOS Linux')
       yum update -y;
       yum install -y git
    ;;
    'MacOS')
      brew update;
      brew install git
    ;;
  esac
fi

if ! is_command 'git'; then
  throw "Git was not installed."
fi
