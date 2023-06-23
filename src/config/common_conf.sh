#!/bin/bash

DOTFILES_CLI_PATH=src/cli

GLOBAL_OS=''

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  OS=$(cat /etc/os-release | grep ID= | awk 'NR == 1 {print $1}' | sed -n 's/ID="\([^"]*\)".*/\1/p')
  echo $OS
elif [[ "$OSTYPE" == "darwin"* ]]; then
  GLOBAL_OS="MacOS"
else
  echo "Unknown OS: $OSTYPE"
  exit 1
fi
