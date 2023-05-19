#!/bin/sh

source ./src/bootstrap/compile_boot.sh || exit 1
import /src/utils/log.sh
import /src/common/install/init.sh 

# To delete the startup configuration in the terminal
if [ -f ~/.zshrc ]; then
  log "INFO" "To remove the config from ~/.zshrc"
  sed -i '' "/$(get_install_start_symbol_in_zshrc)/,/$(get_install_end_symbol_in_zshrc)/d" ~/.zshrc
fi

if [ -f ~/.bashrc ]; then
  log "INFO" "To remove the config from ~/.bashrc"
  sed -i '' "/$(get_install_start_symbol_in_zshrc)/,/$(get_install_end_symbol_in_zshrc)/d" ~/.bashrc
fi

# To delete the runtime directory.
log "INFO" "To remove the runtime files"
rm -rf src/runtime

log "INFO" "TO remove src/main.sh"
rm src/main.sh

