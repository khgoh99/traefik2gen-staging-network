#!/bin/bash 
source ../config.source
source config-custom.source

echo "#### Starting/Updating ${STACKNAME}"
docker stack deploy -c ${STACKPATH}${STACKNAME}.yml -c ${STACKNAME}-custom.yml ${STACKNAME}
