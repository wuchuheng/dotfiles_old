#!/bin/bash

# zsh cli test.
function zsh_uninstalled_test() {
    echo "zsh test after uninstalled."
}

handle_testing_callback "zsh_uninstalled_test" "the integration test of the zsh cli after the dotfiles uninstalled."
