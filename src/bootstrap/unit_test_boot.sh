#!/bin/bash
DOTFILES_BASE_PATH=$(pwd)
source ${DOTFILES_BASE_PATH}/src/utils/autoload.sh || exit 1

import @/src/utils/helper.sh
import @/src/utils/color_printf.sh
import @/src/config/unit_test_conf.sh

is_all_pass=0
global_total_tests=0
global_total_pass=0
global_total_fail=0
total_test_files=0
startTimestamp=$(date +%s)
test_count=0
for test_file in "${ALL_UNIT_TEST_FILES[@]}"; do
  global_test_file_is_pass=0;
  global_pass_test_desc_items=(); # cellect all pass test description items.
  global_pass_test_name_items=(); # cellect all pass test name items.
  global_max_pass_tests_len=0; # get the max test name length.
  source "${DOTFILES_BASE_PATH}/${test_file}" 
  if [ $global_test_file_is_pass -eq 0 ];then
    printf "$(bg_green_print " PASS ") ${test_file}\n"
    for ((i=0; i<${#global_pass_test_name_items[@]}; i++))
    do
	((test_count++))
	str=`printf "  ✔ %-3s%-${global_max_pass_tests_len}s: %s\n"  $test_count "${global_pass_test_name_items[$i]}" "${global_pass_test_desc_items[$i]}"`
	green_print "$str\n"
    done
  printf "\n"
  else
    is_all_pass=1
  fi
  ((total_test_files++))
done

endTimestamp=$(date +%s )
durationTime=$((endTimestamp - startTimestamp ))

printf "$(bold_print 'Tests:')        $(red_print ${global_total_fail}) $(red_print 'failed'), $(green_print "${global_total_pass}" $BOLD) $(green_print 'passed'), %d total\n" ${global_total_tests}
printf "$(bold_print 'Time:')         ${durationTime} s\n"
printf "$(bold_print 'Test files:')   ${total_test_files} f\n"
printf "Ran all test files.\n"
if [ ${is_all_pass} != 0 ]; then
  printf "$(red_print 'Test failed. See above for more details')\n"
  exit 1
else
  exit 0
fi

