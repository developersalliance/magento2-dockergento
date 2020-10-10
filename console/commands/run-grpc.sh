#!/usr/bin/env bash
set -euo pipefail

printf "${GREEN}Start gRPC initialization...${COLOR_RESET}\n"
${COMMANDS_DIR}/magento.sh storefront:grpc:init \\Magento\\CatalogStorefrontApi\\Api\\CatalogProxyServer
printf "${GREEN}End of gRPC initialization${COLOR_RESET}\n"

printf "${GREEN}Starting gRPC server...${COLOR_RESET}\n"
${COMMANDS_DIR}/exec.sh sh -c "nohup ${MAGENTO_DIR}/vendor/bin/grpc-server &>/dev/null & sleep 1"
printf "${GREEN}gRPC server started${COLOR_RESET}\n"

printf "${GREEN}Starting gRPC container in detached mode${COLOR_RESET}\n"
${DOCKER_COMPOSE} up -d ${SERVICE_GRPC}