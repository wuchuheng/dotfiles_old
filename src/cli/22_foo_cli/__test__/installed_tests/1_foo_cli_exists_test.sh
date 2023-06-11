#!/bin/bash

import @/src/main.sh

TEST_NAME="foo"
TEST_DESC="Test whether the foo CLI exists"
START_TIMESTAMP=$(date +%s)
DURATION=0;
local result=`foo`
except_str 'hello world' "${result}"
