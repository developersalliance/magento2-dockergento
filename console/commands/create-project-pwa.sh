#!/bin/bash
set -euo pipefail

usage() {
  printf "${YELLOW}Usage:${COLOR_RESET}\n"
  echo "  create-project-pwa"
  echo ""
  printf "${YELLOW}Description:${COLOR_RESET}\n"
  echo "  PWA: This command creates a new PWA magento project from scratch"
}

if [ "$#" != 0 ] && [ "$1" == "--help" ]; then
  usage
  exit 0
fi

${TASKS_DIR}/start_service_if_not_running.sh ${SERVICE_FRONTEND}

${COMMANDS_DIR}/exec-frontend.sh yarn create @magento/pwa

${COMMANDS_DIR}/create-project.sh

printf "${GREEN}Done!${COLOR_RESET}\n"
