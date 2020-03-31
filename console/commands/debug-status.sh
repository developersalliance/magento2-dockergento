#!/usr/bin/env bash
set -euo pipefail

if [ "$#" != 0 ] && [ "$1" == "--help" ]; then
    exit 0
fi

if [[ $(${COMMANDS_DIR}/exec-debug.sh php -m | grep xdebug) ]]; then
    echo "xDebug: ON";
else
    echo "xDebug: OFF";
fi


