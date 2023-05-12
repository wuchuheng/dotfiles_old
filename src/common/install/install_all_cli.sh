#!/bin/bash

bash $PROJECT_PATH/src/checkers/zshChecker.sh || exit 1
bash $PROJECT_PATH/src/cli/send_email_notification_cli/install_check_send_email_notifcation_cli.sh || exit 1
bash $PROJECT_PATH/src/cli/git_cli/check_is_exist_git_cli.sh || exit 1
