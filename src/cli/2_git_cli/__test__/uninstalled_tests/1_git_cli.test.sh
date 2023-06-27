#!/bin/bash

# git cli test.
function git_uninstalled_test() {
    echo "git test after uninstalled."
}

handle_testing_callback "git_uninstalled_test" "the integration test of the git cli after the dotfiles uninstalled."
