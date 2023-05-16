#!/bin/sh

# Add bootstrap configuration to .zshrc.
readonly local MAIN_FILE_PATH="$(get_full_path $(get_main_sh_path))"
isloadBashrc=$(cat ~/.zshrc | grep "$MAIN_FILE_PATH")
if [ "$isloadBashrc" == '' ]; then
  log "INFO" "To load the main.sh to ~/.zshrc"
  echo "" >>~/.zshrc 
  echo "# Dotfiles start" >>~/.zshrc 
  echo "if [ -e "$MAIN_FILE_PATH" ];then" >>~/.zshrc
  echo "    source $MAIN_FILE_PATH;" >>~/.zshrc
  echo "fi" >>~/.zshrc
  echo "# Dotfiles end" >>~/.zshrc 
  echo "" >>~/.zshrc 
  zsh
  source ~/.zshrc
fi

# Add bootstrap configuration to .bashrc.
if [ -e ~/.bashrc ]; then
  TAG_FOR_BASH="# to load zsh,"
  isloadBashrcToBashrc=$(cat ~/.bashrc | grep "$TAG_FOR_BASH")
  if [ "$isloadBashrcToBashrc" == '' ]; then
      echo "" >> ~/.bashrc
      echo "${TAG_FOR_BASH} start" >> ~/.bashrc
      echo "zsh" >> ~/.bashrc
      echo "${TAG_FOR_BASH} end" >> ~/.bashrc
      echo "" >> ~/.bashrc
  fi
fi
