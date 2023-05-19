#!/bin/sh

readonly TEST_DIR=(
  "src",
  "src/cli",
)

for element in "${TEST_DIR[@]}"
do
  echo "$element"
done

