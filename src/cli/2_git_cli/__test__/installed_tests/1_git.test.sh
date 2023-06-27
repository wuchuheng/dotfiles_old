#!/bin/bash

import @/src/utils/helper.sh
import @/src/utils/test_except.sh

# git cli test.
function git_installed_test() {
  local is_command_exist='false'
  if is_command 'git'; then
    is_command_exist='true'
  fi
  except_str 'true' "${is_command_exist}"
}

handle_testing_callback "git_installed_test" "the integration test of the git cli after the dotfiles installed."

