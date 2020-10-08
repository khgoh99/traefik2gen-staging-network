#!/bin/bash 
source ../config.source
source config-custom.source

echo "#### Stopping ${STACKNAME}"
docker stack rm ${STACKNAME}
