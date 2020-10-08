#!/bin/bash 
source ../config.source
source config-custom.source

echo "MYPATH = $MYPATH"
echo "#### Starting/Updating ${STACKNAME}"
echo "PWD = $PWD"
echo "docker stack deploy -c ${STACKPATH}/${STACKNAME}.yml -c compose-custom.yml ${STACKNAME}"

docker stack deploy -c ${STACKPATH}/${STACKNAME}.yml -c compose-custom.yml ${STACKNAME}
