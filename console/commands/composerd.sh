#!/usr/bin/env bash
set -euo pipefail

COMPOSER_DIR_OPTION="--working-dir=${COMPOSER_DIR}"
if [[ "$#" != 0 \
    && ( $@ == *" -d "*  || $@ == *" -d="* \
        || $@ == "-d "* || $@ == "-d="*  \
        || $@ == *" --working-dir "* || $@ == *" --working-dir="*   \
        || $@ == "--working-dir "* || $@ == "--working-dir="* ) ]]; then
     printf "${RED}Composer directory option not compatible with dockergento. This option is automatically set: ${COLOR_RESET}\n"
     echo ""
     echo "    --working-dir=${COMPOSER_DIR}"
     echo ""
     exit 1
fi

${COMMANDS_DIR}/exec.sh composer "$@" ${COMPOSER_DIR_OPTION}
