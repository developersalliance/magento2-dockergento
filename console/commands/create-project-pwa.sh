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

${TASKS_DIR}/start_service_if_not_running.sh ${SERVICE_FRONTEND_APP}

if [[ -f "${FRONTEND_DIR}/package.json" ]]; then
    printf "${YELLOW}Project already exists. Moving to backend setup.${COLOR_RESET}\n"
else
    ${COMMANDS_DIR}/exec-frontend.sh yarn create @magento/pwa
fi

${COMMANDS_DIR}/create-project.sh

printf "${GREEN}Done!${COLOR_RESET}\n"
