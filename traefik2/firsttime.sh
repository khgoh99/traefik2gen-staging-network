#!/bin/bash 
source ../config.source
source config-custom.source

if [[ $TRAEFIKDOMAIN == "" ]];
then
        echo "**** TRAEFIKDOMAIN in config.source not set yet."
	      echo "**** Please setup config.source first"
	exit 1 
else
        echo "Domain is at $TRAEFIKDOMAIN"
fi

echo "Creating the directory"
mkdir -p $DATAPATH/traefik/setting
mkdir -p $DATAPATH/traefik/log
touch $DATAPATH/traefik/setting/acme.json
chmod 600 $DATAPATH/traefik/setting/acme.json

chown -R nobody:nogroup $DATAPATH

#creating the overlay network
docker network create --driver=overlay traefik-public
docker network create --driver=overlay agent-network
