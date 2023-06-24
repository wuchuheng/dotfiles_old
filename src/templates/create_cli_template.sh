#!/bin/bash

source src/bootstrap/compile_boot.sh || exit 1

import @/src/utils/log.sh
import @/src/utils/color_printf.sh
import @/src/utils/helper.sh

read -p "Please enter the name of the cli tool you want to create: " TOOL_NAME
TOOL_NAME=$(echo "$TOOL_NAME" | sed -E 's/ +/_/g')
order_number=$(get_max_number_by_path "${DOTFILES_BASE_PATH}/src/cli")
((order_number++))
SUB_TARGET_PATH="${DOTFILES_BASE_PATH}/src/cli"
CLI_PATH=${SUB_TARGET_PATH}/${order_number}_${TOOL_NAME}_cli
INSTALLATION_PROVIDER_PATH=${CLI_PATH}/${TOOL_NAME}_cli_installation_provider
UNINSTALLATION_PROVIDER_PATH=${CLI_PATH}/${TOOL_NAME}_cli_uninstallation_provider

# Create directory structure
mkdir -p "${INSTALLATION_PROVIDER_PATH}"
mkdir -p "${UNINSTALLATION_PROVIDER_PATH}"

# Generate File 1: cli_installation_provider.sh
INSTALLATION_PROVIDER="${INSTALLATION_PROVIDER_PATH}/${TOOL_NAME}_cli_installation_provider.sh"
cat > "$INSTALLATION_PROVIDER" << EOF
#!/bin/bash

echo "Installing $TOOL_NAME CLI cli tool..."
# Write installation example code here
EOF
function create_log() {
  local index=${#DOTFILES_BASE_PATH}
  ((index++))
  local file_path=${1:${index}}
  printf "  %s\n" "$(green_print CREATE) ${file_path}"
}
create_log "$INSTALLATION_PROVIDER"

# Generate File 3: main.sh
main_file="${CLI_PATH}/load_${TOOL_NAME}_cli_to_zsh_env_provider.sh"
cat > "$main_file" << EOF
#!/bin/bash

# This is the entry file for $TOOL_NAME CLI tool
# Write the main logic of the CLI tool here
# Add appropriate comments to explain the purpose and functionality of the file
EOF

# Generate File 4: cli_uninstaller.sh
uninstaller_file="${UNINSTALLATION_PROVIDER_PATH}/${TOOL_NAME}_cli_uninstaller_provider.sh"
cat > "$uninstaller_file" << EOF
#!/bin/bash

echo "Uninstalling $TOOL_NAME CLI tool..."
# Write uninstallation example code here
EOF
create_log "$uninstaller_file"

# log  "SUCCESS" "Generate test files 5: __test__"
INSTALLED_TESTS_PATH=${CLI_PATH}/__test__/installed_tests
mkdir -p $INSTALLED_TESTS_PATH

INSTALLED_TEST_FILE=${INSTALLED_TESTS_PATH}/1_${TOOL_NAME}.test.sh
cat > "$INSTALLED_TEST_FILE" << EOF
#!/bin/bash

# ${TOOL_NAME} cli test.
function ${TOOL_NAME}_installed_test() {
    echo "${TOOL_NAME} test after installed."
}

handle_testing_callback "${TOOL_NAME}_installed_test" "the integration test of the ${TOOL_NAME} cli after the dotfiles installed."

EOF
create_log "$INSTALLED_TEST_FILE"

UNINSTALLED_TESTS_PATH=${CLI_PATH}/__test__/uninstalled_tests
mkdir -p ${UNINSTALLED_TESTS_PATH}

UNINSTALLED_TEST_FILE=${UNINSTALLED_TESTS_PATH}/1_${TOOL_NAME}_cli.test.sh
cat > "$UNINSTALLED_TEST_FILE" << EOF
#!/bin/bash

# ${TOOL_NAME} cli test.
function ${TOOL_NAME}_uninstalled_test() {
    echo "${TOOL_NAME} test after uninstalled."
}

handle_testing_callback "${TOOL_NAME}_uninstalled_test" "the integration test of the ${TOOL_NAME} cli after the dotfiles uninstalled."
EOF

create_log "$UNINSTALLED_TEST_FILE"

##
# Push a new item of test directory to src/config/test_conf.sh
#
##

bash_path_len=${#DOTFILES_BASE_PATH}
((bash_path_len++))
echo ${bash_path_len}
push_dir_to_test_conf ${CLI_PATH:${bash_path_len}}/__test__

