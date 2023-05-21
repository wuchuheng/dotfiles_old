#!/bin/bash

TEST_NAME="foo"
TEST_DESC="Test whether the foo CLI exists"
START_TIMESTAMP=$(date +%s)
DURATION=0;
if command -v foo >/dev/null 2>&1; then
    DURATION=$(date +%s) - ${START_TIMESTAMP}
    exit 1;
else
    DURATION=$(date +%s) - ${START_TIMESTAMP}
    exit 0;
fi

