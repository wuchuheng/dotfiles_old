#!/bin/sh

DOTFILES_BASE_PATH=$(pwd)
source $DOTFILES_BASE_PATH/src/utils/helper.sh || exit 1
import /src/utils/color_printf.sh

readonly TEST_DIR=(
  "src"
  # "src/cli/19_hello_cli"
  # "src/cli/20_tmp_cli"
)

test_by_dir_path() {
  local bash_path="$(get_full_path $1)/__test__/installed_tests"
  local files=($(get_files_by_path ${bash_path}))
  local total_tests=0
  local total_pass=0
  local total_fail=0
  for file in "${files[@]}"; do
    ((total_tests++))
    is_path=0
    source "${bash_path}/${file}" 
    if [ ${is_pass} == 0 ];then
      printf "$(bg_green_print " PASS ") ${file}\n"
      ((total_pass++))
    else
      ((total_fail++))
    fi
  done
  echo ""
  printf "$(bold_print 'Tests:')      $(red_print ${total_fail}) $(red_print 'failed'), $(green_print "${total_pass}" $BOLD) $(green_print 'passed'), %d total\n" ${total_tests}
  # bg_red_print " FAIL "
}

for element in "${TEST_DIR[@]}"
do
  test_by_dir_path "$element"
done

