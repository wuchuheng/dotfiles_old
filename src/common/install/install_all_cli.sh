#!/bin/bash


## 
# To install all cli tools from the src/cli directory.
#
##
readonly main_sh_path=$(get_full_path $(get_main_sh_path))

to_load_all_cli_template=${DOTFILES_BASE_PATH}/src/common/install/to_load_all_cli_template.sh
cat ${to_load_all_cli_template} >> ${main_sh_path}


