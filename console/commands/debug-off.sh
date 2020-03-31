#!/usr/bin/env bash
set -euo pipefail

${TASKS_DIR}/start_service_if_not_running.sh ${SERVICE_PHP_XDEBUG}

${COMMANDS_DIR}/exec-debug.sh sed -i -e 's/^\zend_extension/;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

${DOCKER_COMPOSE} restart ${SERVICE_PHP_XDEBUG}

printf "> ${GREEN}xdebug disabled${COLOR_RESET}\n"
