#!/bin/bash

TEST_NAME="tmp"
TEST_DESC="Test whether the tmp CLI exists"
START_TIMESTAMP=$(date +%s)
DURATION=0;
if command -v tmp >/dev/null 2>&1; then
    DURATION=$(date +%s) - ${START_TIMESTAMP}
    exit 1;
else
    DURATION=$(date +%s) - ${START_TIMESTAMP}
    exit 0;
fi

