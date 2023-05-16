#!/bin/bash

# bash $PROJECT_PATH/src/checkers/zshChecker.sh || exit 1
# bash $PROJECT_PATH/src/cli/send_email_notification_cli/install_check_send_email_notifcation_cli.sh || exit 1
# bash $PROJECT_PATH/src/cli/git_cli/check_is_exist_git_cli.sh || exit 1

## 
# To install all cli tools from the src/cli directory.
#
##
cli_dir_list=$(get_all_cli_directory_in_cli_path)
for directory in ${cli_dir_list[@]}; do
  IFS="_" read -ra parts <<< "$directory"
  number=${parts[0]}
  number=$((${#number} + 1))
  cli_name="${directory:$number}"
  installation_provider=/src/cli/$directory/${cli_name}_installation_provider/${cli_name}_installation_provider.sh
  # To set up the install progress to install the cli
  import ${installation_provider}
  # Add bootstrap configuration to zsh env
  local readonly START_SYMBOL_FOR_BASH=$(get_zsh_start_symbol ${cli_name})
  local readonly END_SYMBOL_FOR_BASH=$(get_zsh_end_symbol ${cli_name})
  local readonly main_sh_path=$(get_full_path $(get_main_sh_path))
  isloadBashrcToBashrc=$(cat ${main_sh_path} | grep "${START_SYMBOL_FOR_BASH}")
  if [ "$isloadBashrcToBashrc" == '' ]; then
      echo "${START_SYMBOL_FOR_BASH}" >> ${main_sh_path}
      echo "import $(get_cli_to_env_provider_by_cli_directory_name $directory)" >> ${main_sh_path}
      echo "${END_SYMBOL_FOR_BASH}" >> ${main_sh_path}
  fi
done


