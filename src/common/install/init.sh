#!/bin/bash

RUNTIME_LOGS_PATH=$PROJECT_PATH/src/runtime/logs 

if [ ! -e $RUNTIME_LOGS_PATH  ]; then
  mkdir -p $RUNTIME_LOGS_PATH
fi
