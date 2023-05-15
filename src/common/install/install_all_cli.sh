#!/bin/bash

# bash $PROJECT_PATH/src/checkers/zshChecker.sh || exit 1
# bash $PROJECT_PATH/src/cli/send_email_notification_cli/install_check_send_email_notifcation_cli.sh || exit 1
# bash $PROJECT_PATH/src/cli/git_cli/check_is_exist_git_cli.sh || exit 1

cli_array=()

#cli_path=$DOTFILES_BASE_PATH/src/cli
#for directory in "$cli_path"/*/; do
#  if [[ -d "$directory" ]]; then
#    directory=${directory:0:${#directory} - 1}
#    last_directory_name=${directory//$cli_path\//}
#    echo $last_directory_name 
#    IFS="_" read -ra parts <<< "$last_directory_name"
#    cli_array[${parts[0]}]=$last_directory_name
#  fi
#done

#echo ${cli_array[@]}
max_number=$(($(get_max_number_in_cli_path)))
echo $max_number

