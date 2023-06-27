#!/bin/bash

import @/src/utils/cli_helper.sh
import @/src/utils/log.sh

function to_install_oh_my_zsh() {
  local cache_path=$(get_cache_dir 'zsh_cli')/oh_my_zsh
  git clone  https://github.com/ohmyzsh/ohmyzsh.git "${cache_path}"

  if [ $? == 0 ];then
    log "INFO" "To clone the Oh my zsh was successfull."
  else
    throw "To clone the Oh my zsh was Failed."
  fi
}
