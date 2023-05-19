#!/bin/sh

# Add bootstrap configuration to .bashrc.
if [ -f ~/.bashrc ]; then
  TAG_FOR_BASH="$(get_install_start_symbol_in_zshrc)"
  isloadBashrcToBashrc=$(cat ~/.bashrc | grep "$TAG_FOR_BASH")
  if [ "$isloadBashrcToBashrc" == '' ]; then
      echo "To change bashrc"
      echo "$(get_install_start_symbol_in_zshrc)" >> ~/.bashrc
      echo "zsh" >> ~/.bashrc
      echo "$(get_install_end_symbol_in_zshrc)" >> ~/.bashrc
  fi
fi

# Add bootstrap configuration to .zshrc.
readonly local MAIN_FILE_PATH="$(get_full_path $(get_main_sh_path))"
isloadBashrc=$(cat ~/.zshrc | grep "$MAIN_FILE_PATH")

if [ "$isloadBashrc" == '' ]; then
  log "INFO" "To load the main.sh to ~/.zshrc"
  echo "$(get_install_start_symbol_in_zshrc)" >>~/.zshrc 
  echo "if [ -e "$MAIN_FILE_PATH" ];then" >>~/.zshrc
  echo "    source $MAIN_FILE_PATH;" >>~/.zshrc
  echo "fi" >>~/.zshrc
  echo "$(get_install_end_symbol_in_zshrc)" >>~/.zshrc 
  zsh
  source ~/.zshrc
fi
