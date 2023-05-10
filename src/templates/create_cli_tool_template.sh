#!/bin/bash

CURRENT_FILE_PATH="$(dirname $0)"

source $CURRENT_FILE_PATH/../utils/log.sh

read -p "Please enter the name of the tool you want to create: " TOOL_NAME
TOOL_NAME=$(echo "$TOOL_NAME" | sed -E 's/ +/_/g')

SUB_TARGET_PATH="${CURRENT_FILE_PATH}/../tools"

# Create directory structure
mkdir -p "${SUB_TARGET_PATH}/${TOOL_NAME}_cli/${TOOL_NAME}_cli_installer"
mkdir -p "${SUB_TARGET_PATH}/${TOOL_NAME}_cli/${TOOL_NAME}_cli_uninstaller"

# Generate File 1: cli_installer.sh
installer_file="${SUB_TARGET_PATH}/${TOOL_NAME}_cli/${TOOL_NAME}_cli_installer/${TOOL_NAME}_cli_installer.sh"
cat > "$installer_file" << EOF
#!/bin/bash

echo "Installing $TOOL_NAME CLI tool..."
# Write installation example code here
EOF

# Generate File 2: is_installed_cli.sh
is_installed_file="${SUB_TARGET_PATH}/${TOOL_NAME}_cli/${TOOL_NAME}_cli_installer/is_installed_${TOOL_NAME}_cli.sh"
cat > "$is_installed_file" << EOF
#!/bin/bash

# Write example code here to check if the tool is already installed
# Return 0 if installed; Return 1 if not installed
EOF

# Generate File 3: main.sh
main_file="${SUB_TARGET_PATH}/${TOOL_NAME}_cli/${TOOL_NAME}_cli_main.sh"
cat > "$main_file" << EOF
#!/bin/bash

# This is the entry file for $TOOL_NAME CLI tool
# Write the main logic of the tool here
# Add appropriate comments to explain the purpose and functionality of the file
EOF

# Generate File 4: cli_uninstaller.sh
uninstaller_file="${SUB_TARGET_PATH}/${TOOL_NAME}_cli/${TOOL_NAME}_cli_uninstaller/${TOOL_NAME}_cli_uninstaller.sh"
cat > "$uninstaller_file" << EOF
#!/bin/bash

echo "Uninstalling $TOOL_NAME CLI tool..."
# Write uninstallation example code here
EOF

log "SUCCESS" "Successfully created $TOOL_NAME CLI tool template files."

