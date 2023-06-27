#!/bin/bash

import @/src/utils/cli_helper.sh

## 
# To install all cli tools from the src/cli directory.
#
##
function to_install_all_cli() {
  local readonly main_sh_path=$(get_full_path $(get_main_sh_path))
  to_load_all_cli_template=${DOTFILES_BASE_PATH}/src/common/install/to_load_all_cli_template.sh
  cat ${to_load_all_cli_template} >> ${main_sh_path}
  local all_cli=($(get_all_sub_dir_by_path "${DOTFILES_BASE_PATH}/${DOTFILES_CLI_PATH}"))
  for cli_name in ${all_cli[@]}; do
    local cli_number=$(get_cli_number_by_cli_name_with_number "${cli_name}")
    local cli_name_without_number=$(get_cli_name_by_cli_name_with_number "${cli_name}")
    local profider=${DOTFILES_CLI_PATH}/${cli_name}/${cli_name_without_number}_installation_provider/${cli_name_without_number}_installation_provider.sh
    import @/${profider} 
  done
}

