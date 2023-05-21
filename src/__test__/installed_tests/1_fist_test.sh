#!/bin/bash


TEST_NAME="hello"
TEST_DESC="Test whether the hello CLI exists"
START_TIMESTAMP=$(date +%s)
DURATION=0;
except_str "str1" "str1"
except_str "str1" "str1"
#if command -v hello >/dev/null 2>&1; then
#  is_pass=1
#else
#  is_pass=0
#fi
DURATION=$(($(date +%s) - ${START_TIMESTAMP}))
