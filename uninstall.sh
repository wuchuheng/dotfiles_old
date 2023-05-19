#!/bin/sh

source ./src/bootstrap/compile_boot.sh || exit 1
import /src/utils/log.sh
import /src/common/install/init.sh 

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

# To delete the runtime directory.
if [ -d src/runtime ]; then
  rm -rf src/runtime
  if [ $? != 0 ]; then
    log "INFO" "To remove the runtime files"
  fi
else
  is_ok=0
fi

if [ -f src/main.sh ]; then
  rm src/main.sh
  if [ $? != 0 ]; then
    log "INFO" "TO remove src/main.sh"
  fi
else
  is_ok=0
fi

if [ $? == 0 ] || [ $is_ok == 0 ]; then
  log "SUCCESS" "Uninstall Sucessfully"
fi

