## Autoload CLI 
cli_dir_list=($(get_all_cli_directory_in_cli_path))
for directory in "${cli_dir_list[@]}"; do
  IFS="_" read -r parts <<< "$directory"
  number=${parts[0]}
  number=$((${#number} + 1))
  cli_name="${directory:$number}"
  installation_provider=/src/cli/$directory/${cli_name}_installation_provider/${cli_name}_installation_provider.sh
   import $(get_cli_to_env_provider_by_cli_directory_name $directory)
done
