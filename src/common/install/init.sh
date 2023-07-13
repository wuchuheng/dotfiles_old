#!/bin/bash

import @/src/utils/helper.sh

function init_main_zsh() {
  local readonly main_sh_path=$(get_full_path $(get_main_sh_path))
  if [ ! -f ${main_sh_path} ]; then
    touch ${main_sh_path}
    chmod +x ${main_sh_path}
    cat > ${main_sh_path} <<EOF
#!/bin/zsh

DOTFILES_BASE_PATH=${DOTFILES_BASE_PATH}
source ${DOTFILES_BASE_PATH}/src/zsh_toolbox/autoload.zsh || exit

EOF
  fi
}

function get_install_start_symbol_in_zshrc() {
  echo $(get_zsh_start_symbol "To load zsh")
}

function get_install_end_symbol_in_zshrc() {
  echo $(get_zsh_end_symbol "To load zsh")
}


