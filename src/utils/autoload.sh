#!/bin/bash

function import() {
  local RED='\033[0;31m'
  local NC='\033[0m'
  local timestamp=$(date +"%Y-%m-%d %T")
  local path=$1
  local fist_chart=${path:0:1}
  source_file=""
  local previous_file=`caller 2 | awk '{print $3}'`
  local previous_dir="$(cd "$(dirname "${previous_file}")" && pwd)"
  case ${fist_chart} in
    # The @ symbol is equivalent to the project's root directory
    @)
        source_file=${DOTFILES_BASE_PATH}${path:1}
        ;;
    /)
	# To load file from a absolute path in OS.
        source_file=${path}
        ;;
    .)
	# To load file from a relative path in the project.
	local second_chart=${path:1:1}
	local dot_chart=${path:1:2}
	# The path of the loaded file is referenced by the current file path 
	if [ $second_chart == '/' ]; then
          source_file=${previous_dir}${path:1}
        elif [ ${dot_chart} == './' ]; then
          source_file=${previous_dir}${path:2}
	fi
        ;;
    *)
          source_file=${previous_dir}/${path}
        ;;
  esac
  # source_file=${DOTFILES_BASE_PATH}${path}
  source "$source_file";
  if [ $? != 0 ]; then
    IFS=' ' read -r -a parts <<< $(caller 0)
    printf "${RED}✖ ${timestamp} %s: line %s: %s ${NC} \n" ${parts[2]} ${parts[0]} "Failed to load $source_file, the file not found."
    exit 1
  fi
}

