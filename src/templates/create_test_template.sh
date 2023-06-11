#!/bin/bash

source src/bootstrap/compile_boot.sh || exit 1
import @/src/utils/log.sh
import @/src/utils/color_printf.sh

read -p "Please enter a testing file name you want to create: " TOOL_NAME
