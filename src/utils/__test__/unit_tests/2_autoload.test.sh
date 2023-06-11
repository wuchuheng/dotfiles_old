#!/bin/bash

import @/src/utils/test_except.sh

# the demo testing
function autoload_test() {
  local readonly BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  local readonly file_name=file.sh
  local relative_path=${BASE_PATH:${#DOTFILES_BASE_PATH}}/${file_name}
  local readonly bash_script_file=${BASE_PATH}/${file_name}
  cat > ${bash_script_file} << EOF
#!/bin/bash  
echo "hello"
EOF
  #Import the file from the relactive path of the project root
  local readonly reault=`import @${relative_path}`
  except_str "${reault}" 'hello'
  local readonly BASE_PATH=$(get_runtime_space_by_unit_test_name ${global_test_name})
  local relative_runtime_path=${BASE_PATH:${#DOTFILES_BASE_PATH}}
  result=`import ./../../../..${relative_runtime_path}/${file_name}`
  except_str "${reault}" 'hello'
  result=`import ../../../../..${relative_runtime_path}/${file_name}`
  except_str "${result}" 'hello'

  local current_dir="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
  local test_tmp_file=${current_dir}/test_tmp.test.sh
  cat > ${test_tmp_file} << EOF
#!/bin/bash  
echo "tmp"
EOF
  result=`import test_tmp.test.sh`
  except_str "${result}" 'tmp'
}

handle_testing_callback "autoload_test" "Unit test src/utils/__test__/unit_tests/2_autoload.test.sh"

