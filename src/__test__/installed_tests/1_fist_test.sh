#!/bin/bash


TEST_NAME="hello"
TEST_DESC="Test whether the hello CLI exists"
START_TIMESTAMP=$(date +%s)
DURATION=0;
if command -v hello >/dev/null 2>&1; then
    DURATION=$(date +%s) - ${START_TIMESTAMP}
    exit 0;
else
    DURATION=$(date +%s) - ${START_TIMESTAMP}
    exit 1;
fi
