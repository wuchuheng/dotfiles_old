#!/bin/bash

DOTFILES_BASE_PATH=$(pwd)
source ${DOTFILES_BASE_PATH}/src/utils/autoload.sh || exit 1

import @/src/handlers/exception_handler.sh
import @/src/utils/helper.sh

function my_function() {
  echo "Line number inside my_function: $LINENO"
}

echo "Line number outside any function: $LINENO"

my_function
