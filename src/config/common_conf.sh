#!/bin/bash

DOTFILES_CLI_PATH=src/cli

GLOBAL_OS=''


if [[ "$OSTYPE" == "linux-gnu" ]]; then
  OS=$(cat /etc/os-release | grep NAME= | awk 'NR == 1 {print $0}' |  sed -n 's/NAME="\([^"]*\)".*/\1/p')
  case ${OS} in
    'Ubuntu')
        GLOBAL_OS='Ubuntu';
    ;;
    'PRETTY_Ubuntu')
        GLOBAL_OS='Ubuntu';
    ;;
    'CentOS Linux')
        GLOBAL_OS='CentOS Linux';
    ;;
    *)
	throw "Unknown OS: $OSTYPE"
    ;;
  esac
elif [[ "$OSTYPE" == "darwin"* ]]; then
  GLOBAL_OS="MacOS"
else
  throw "Unknown OS: $OSTYPE"
fi