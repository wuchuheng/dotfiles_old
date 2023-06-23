#!/bin/bash

import @/src/utils/test_except.sh

function throw_test() {
  local result=$( (throw "hello") ); local line="${LINENO}"
  local current_file=${BASH_SOURCE[0]}
  local except_value="$(bg_red_print ' EXCEPTION ') ${current_file}:${line} $(red_print 'hello')"
  local file_part_of_code=$(get_a_part_of_code "${current_file}" "${line}")
  except_value=$(cat <<EOF
${except_value}
${file_part_of_code}
EOF
)
  except_str "${except_value}" "${result}"
}

handle_testing_callback "throw_test" "To throw function" 
