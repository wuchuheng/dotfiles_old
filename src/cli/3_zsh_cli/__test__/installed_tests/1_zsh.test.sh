#!/bin/bash

import @/src/utils/helper.sh
import @/src/utils/test_except.sh

# zsh cli test.
function zsh_installed_test() {
  local is_command_exist='false'
  if is_command 'zsh'; then
    is_command_exist='true'
  fi
  except_str 'true' "${is_command_exist}"
}

handle_testing_callback "zsh_installed_test" "the integration test of the zsh cli after the dotfiles installed."

