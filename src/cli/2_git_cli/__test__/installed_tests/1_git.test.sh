#!/bin/bash

# git cli test.
function git_installed_test() {
    echo "git test after installed."
}

handle_testing_callback "git_installed_test" "the integration test of the git cli after the dotfiles installed."

