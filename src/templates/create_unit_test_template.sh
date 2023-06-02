#!/bin/bash


###
# 创建单元测试模板文件
#
##

source src/bootstrap/compile_boot.sh || exit 1
import /src/utils/log.sh
import /src/utils/color_printf.sh

# 输出confirm
printf "$(green_print '  Please enter a unit testing file name you want to create')\n"
printf "$(green_print '  For example: src/utils/helper.sh')\n"
printf "$(green_print '  The unit testing file: src/utils/__test__/unit_tests/01_helper_test.sh will be to generated')\n"
read -p "$(green_print '  💪 To input the file name to create a new unit test file:')" UNIT_TEST_FILE
if [ ! -f ${UNIT_TEST_FILE} ]; then
  log "ERROR" "Not found file: ${UNIT_TEST_FILE}";
  exit 1
fi


BASE_DIR=$(get_directory "${UNIT_TEST_FILE}")
BASE_DIR=${DOTFILES_BASE_PATH}/${BASE_DIR}/__test__/unit_tests
if [ ! -d ${BASE_DIR} ]; then
  mkdir -p ${BASE_DIR}
fi
setopt KSH_ARRAYS >/dev/null 2>&1
path_info=($(split_str "${UNIT_TEST_FILE}" '/'))
readonly FILE_NAME=${path_info[${#path_info[@]} - 1]}
relative_path=${BASE_DIR:${#DOTFILES_BASE_PATH}}
max_number=$(($(get_max_number_file_by_path  ${BASE_DIR}) + 1))
setopt KSH_ARRAYS >/dev/null 2>&1
readonly FILE_NAME_INFO=($(split_str "${FILE_NAME}" '.'))
file_name_without_extend=''
for ((i = 0; i < ((${#FILE_NAME_INFO[@]} - 1)); i++)); do
  file_name_without_extend=${file_name_without_extend}.${FILE_NAME_INFO[$i]}
done
file_name_without_extend=${file_name_without_extend:1}
last_index=$(expr ${#FILE_NAME_INFO[@]} - 1)
readonly FILE_EXTEND=${FILE_NAME_INFO[${last_index}]}
readonly full_file_name=${BASE_DIR}/${max_number}_${file_name_without_extend}_test.${FILE_EXTEND}

# Create a unit testing file
# TODO: 添加测试模板代码, 包含测试名
# 
cat > ${full_file_name} << EOF 
hello


EOF

log "SUCCESS" "🎉  To create a unit testing file ${full_file_name}"

