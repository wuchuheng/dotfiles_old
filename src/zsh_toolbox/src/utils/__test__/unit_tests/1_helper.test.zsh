#!/usr/bin/env zsh

import @/src/handlers/testing_callback_handler.zsh

# the demo testing
function hello_world_callback_test() {
    echo "Callback function called with parameter"
}

# call hello_world_test() function，and pass the testing callback with the testing name and testing description.
testing_callback_handle "hello_world_callback_test" "Unit test src/utils/__test__/unit_tests/1_helper.test.zsh"
