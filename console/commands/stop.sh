#!/usr/bin/env bash
set -euo pipefail

${DOCKER_COMPOSE} stop "$@"

if [[ "${MACHINE}" == "mac" && "${USE_MUTAGEN_SYNC}" == "1" ]]; then
    ${TASKS_DIR}/mutagen_sync.sh stop
    ${TASKS_DIR}/mutagen_sync_frontend.sh stop
fi
