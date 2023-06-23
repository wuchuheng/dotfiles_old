#!/bin/bash

import @/src/utils/helper.sh
import @/src/utils/color_printf.sh

##
# throw exception
#
# @use throw "exception info"
# @echo #void
##
function throw() {
  local test_file=${BASH_SOURCE[1]}
  current_file=${test_file:${prefix_path_len}}
  local line="${BASH_LINENO[0]}"
  printf "$(bg_red_print " EXCEPTION ") ${current_file}:${line} $(red_print "$1")\n"
  get_a_part_of_code ${current_file} ${line}
  exit 1
}

