#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
BLACK='\033[0;30m'
PINK='\033[38;2;225;113;104m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BG_GREEN="\e[42m"
BG_RED="\e[41m"
BOLD='\e[1m'
NC='\e[0m'

function bg_green_print() {
  printf "${BOLD}${BLACK}${BG_GREEN}%s\e[0m" $1
}

function bold_print() {
  printf "%s%s%s" "${BOLD}" "$1" '\e[0m'
}

bg_red_print() {
  printf "${BOLD}${BLACK}${BG_RED}$1\e[0m"
}

back_print() {
  printf "${BLACK}%s${NC}" $1
}
pink_print() {
  printf "${PINK}%s${NC}" $1
}
green_print() {
  sold=${2:-''}
  printf "${GREEN}${1}${NC}"
}

yellow_print() {
  printf "${YELLOW}%s${NC}" $1
}

blue_print() {
  printf "${BLUE}%s${NC}" $1
}

red_print() {
  printf "${RED}$1\e[0m"
}

