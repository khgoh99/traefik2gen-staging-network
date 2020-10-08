#!/bin/bash 
source ../config.source
source config-custom.source

echo "Creating the directory"
mkdir -p $DATAPATH/$STACKNAME/setting
mkdir -p $DATAPATH/$STACKNAME/log
touch $DATAPATH/$STACKNAME/setting/acme.json
chmod 600 $DATAPATH/$STACKNAME/setting/acme.json

chown -R nobody:nogroup $DATAPATH

#creating the overlay network
docker network create --driver=overlay traefik-public
docker network create --driver=overlay agent-network
