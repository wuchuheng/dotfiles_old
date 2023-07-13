#!/bin/bash

source ./src/bootstrap/compile_boot.sh || exit 1

import @/src/utils/log.sh
import @/src/common/install/init.sh 
import @/src/common/install/uninstall_all_cli.sh
import @/src/utils/helper.sh

is_ok=1

# To delete the startup configuration in the terminal
if [ -f ~/.zshrc ]; then
  sed -i '' "/$(get_install_start_symbol_in_zshrc)/,/$(get_install_end_symbol_in_zshrc)/d" ~/.zshrc
  if [ $? != 0 ]; then
    log "INFO" "To remove the config from ~/.zshrc"
  fi
else
  is_ok=0
fi

if [ -f ~/.bashrc ]; then
  sed -i '' "/$(get_install_start_symbol_in_zshrc)/,/$(get_install_end_symbol_in_zshrc)/d" ~/.bashrc
  if [ $? != 0 ]; then
    log "INFO" "To remove the config from ~/.bashrc"
  fi
else
  is_ok=0
fi

# Uninstall all cli.
uninstall_all_cli

# To delete the runtime directory.
if [ -d src/runtime ]; then
  rm -rf src/runtime
  if [ $? != 0 ]; then
    log "INFO" "To remove the runtime files"
  fi
else
  is_ok=0
fi



if [ -f "${DOTFILES_BASE_PATH}$(get_main_sh_path)" ]; then
  rm "${DOTFILES_BASE_PATH}$(get_main_sh_path)"
  if [ $? != 0 ]; then
    log "INFO" "TO remove $(get_main_sh_path)"
  fi
else
  is_ok=0
fi

if [ $? == 0 ] || [ $is_ok == 0 ]; then
  log "SUCCESS" "Uninstall Sucessfully"
fi

