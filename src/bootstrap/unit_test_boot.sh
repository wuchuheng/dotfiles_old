#!/bin/bash
DOTFILES_BASE_PATH=$(pwd)
source ${DOTFILES_BASE_PATH}/src/utils/autoload.sh || exit 1

import /src/utils/helper.sh
import /src/utils/color_printf.sh
import /src/config/unit_test_conf.sh

is_all_pass=0
global_total_tests=0
global_total_pass=0
global_total_fail=0
startTimestamp=$(date +%s)

for  test_file in "${ALL_UNIT_TEST_FILES[@]}"; do
  ((global_total_tests++))
  global_is_pass=0
  source "${DOTFILES_BASE_PATH}/${test_file}" 
  if [ $global_is_pass -eq 0 ];then
    printf "$(bg_green_print " PASS ") ${test_file}\n"
    ((global_total_pass++))
  else
    ((global_total_fail++))
    printf "$(bg_red_print " FAIL ") ${test_file}\n"
    is_all_pass=1
  fi
done

endTimestamp=$(date +%s )
durationTime=$((endTimestamp - startTimestamp ))

echo ""
printf "$(bold_print 'Tests:')      $(red_print ${global_total_fail}) $(red_print 'failed'), $(green_print "${global_total_pass}" $BOLD) $(green_print 'passed'), %d total\n" ${global_total_tests}
printf "$(bold_print 'Time:')        ${durationTime} s\n"
printf "Ran all test files.\n"
if [ ${is_all_pass} != 0 ]; then
  printf "$(red_print 'Test failed. See above for more details')\n"
fi

