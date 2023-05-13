#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

green_print() {
  printf "${GREEN}%s${NC}" $1
}

yellow_print() {
  printf "${YELLOW}%s${NC}" $1
}

blue_print() {
  printf "${BLUE}%s${NC}" $1
}

red_print() {
  printf "${RED}%s${NC}" $1
}
