#!/usr/bin/env bash
set -euo pipefail

printf "${GREEN}Starting backend containers in detached mode${COLOR_RESET}\n"
${DOCKER_COMPOSE} up -d ${SERVICE_APP}

printf "${GREEN}Starting frontend containers in detached mode${COLOR_RESET}\n"
${DOCKER_COMPOSE} up -d ${SERVICE_FRONTEND}

${TASKS_DIR}/validate_bind_mounts.sh

echo "Waiting for everything to spin up..."
sleep 5

if [[ "${MACHINE}" == "linux" ]]; then
    echo " > fixing permissions"
    ${TASKS_DIR}/fix_linux_permissions.sh
    echo " > permissions fix finished"
fi

if [[ "${MACHINE}" == "mac" && "${USE_MUTAGEN_SYNC}" == "1" ]]; then
    echo " > starting mutagen sync session"
    ${TASKS_DIR}/mutagen_sync.sh start
    printf " > mutagen sync started\n"

    echo " > starting mutagen frontend sync session"
    ${TASKS_DIR}/mutagen_sync_frontend.sh start
    printf " > mutagen sync started\n"
fi
