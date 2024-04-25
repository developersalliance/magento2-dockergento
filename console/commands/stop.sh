#!/usr/bin/env bash
set -euo pipefail

${DOCKER_COMPOSE} stop "$@"

if [[ "${USE_MUTAGEN_SYNC}" == "1" ]]; then
    ${TASKS_DIR}/mutagen_sync.sh stop
fi
