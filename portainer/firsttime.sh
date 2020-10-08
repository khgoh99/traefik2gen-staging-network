#!/bin/bash 
source ../config.source
source config-custom.source

mkdir -p $DATAPATH/$STACKNAME/data
chown -R nobody:nogroup $DATAPATH

#creating the overlay network
docker network create --driver=overlay agent-network
