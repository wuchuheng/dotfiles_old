#!/bin/bash

check_command() {
  if command -v "$1" >/dev/null 2>&1; then
    return 0 # return true
  else
    return 1 # return false
  fi
}
