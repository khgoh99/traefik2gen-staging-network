#!/bin/bash 
source ../config.source
source config-custom.source

echo "Creating the directory"
mkdir -p $TRAEFIK_SETTING
mkdir -p $TRAEFIK_LOGS
touch $TRAEFIK_SETTING/acme.json
chmod 600 $TRAEFIK_SETTING/acme.json

chown -R nobody:nogroup $DATAPATH

#creating the overlay network
docker network create --driver=overlay traefik-public
docker network create --driver=overlay agent-network
