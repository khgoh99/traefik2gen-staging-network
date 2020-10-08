#!/bin/bash 
source ../config.source

export STACKNAME="traefik2"

echo "#### Updating ${STACKNAME}, Domain:${TRAEFIKDOMAIN}"
docker stack deploy -c ${STACKPATH}${STACKNAME}.yml -c ${STACKNAME}-custom.yml ${STACKNAME}
