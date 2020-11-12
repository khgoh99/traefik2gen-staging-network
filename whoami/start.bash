#!/bin/bash 
source ../config.source
source config-custom.source

echo "#### Starting/Updating ${STACKNAME}"
docker stack deploy -c ${BASESTACKYML} -c compose-custom.yml ${STACKNAME}
