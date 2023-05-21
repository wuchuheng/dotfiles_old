#!/bin/bash

source src/bootstrap/compile_boot.sh || exit 1
import /src/utils/log.sh
import /src/utils/color_printf.sh

read -p "Please enter the name of the cli tool you want to create: " TOOL_NAME
TOOL_NAME=$(echo "$TOOL_NAME" | sed -E 's/ +/_/g')
order_number=$(expr "$(($(get_max_number_in_cli_path)))" + 1)
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
log "INFO" "$(green_print CREATE) $INSTALLATION_PROVIDER"

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
log "INFO" "$(green_print CREATE) $uninstaller_file"

# log  "SUCCESS" "Generate test files 5: __test__"
INSTALLED_TESTS_PATH=${CLI_PATH}/__test__/installed_tests
mkdir -p $INSTALLED_TESTS_PATH

CLI_EXISTS_TEST_FILE=${INSTALLED_TESTS_PATH}/1_${TOOL_NAME}_cli_exists_test.sh
cat > "$CLI_EXISTS_TEST_FILE" << EOF
#!/bin/bash

import /src/main.sh

TEST_NAME="${TOOL_NAME}"
TEST_DESC="Test whether the ${TOOL_NAME} CLI exists"
START_TIMESTAMP=\$(date +%s)
DURATION=0;
if command -v ${TOOL_NAME} >/dev/null 2>&1; then
    DURATION=\$(date +%s) - \${START_TIMESTAMP}
    exit 0;
else
    DURATION=\$(date +%s) - \${START_TIMESTAMP}
    exit 1;
fi

EOF
log "INFO" "$(green_print CREATE) $CLI_EXISTS_TEST_FILE"

CLI_AVAILABLE_TEST_FILE=${INSTALLED_TESTS_PATH}/2_${TOOL_NAME}_cli_available_test.sh
cat > "$CLI_AVAILABLE_TEST_FILE" << EOF
#!/bin/bash

TEST_NAME="${TOOL_NAME}"
TEST_DESC="Test whether the ${TOOL_NAME} CLI exists"
START_TIMESTAMP=\$(date +%s)
DURATION=0;
if command -v ${TOOL_NAME} >/dev/null 2>&1; then
    DURATION=\$(date +%s) - \${START_TIMESTAMP}
    exit 0;
else
    DURATION=\$(date +%s) - \${START_TIMESTAMP}
    exit 1;
fi

EOF
log "INFO" "$(green_print CREATE) $CLI_AVAILABLE_TEST_FILE"

UNINSTALLED_TESTS_PATH=${CLI_PATH}/__test__/uninstalled_tests
mkdir -p ${UNINSTALLED_TESTS_PATH}

CLI_INVALID_TEST_FILE=${UNINSTALLED_TESTS_PATH}/1_${TOOL_NAME}_cli_invalid_test.sh
cat > "$CLI_INVALID_TEST_FILE" << EOF
#!/bin/bash

TEST_NAME="${TOOL_NAME}"
TEST_DESC="Test whether the ${TOOL_NAME} CLI exists"
START_TIMESTAMP=\$(date +%s)
DURATION=0;
if command -v ${TOOL_NAME} >/dev/null 2>&1; then
    DURATION=\$(date +%s) - \${START_TIMESTAMP}
    exit 1;
else
    DURATION=\$(date +%s) - \${START_TIMESTAMP}
    exit 0;
fi

EOF

log "INFO" "$(green_print CREATE) $CLI_INVALID_TEST_FILE"

