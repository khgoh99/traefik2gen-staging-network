#!/bin/bash 
source ../config.source
source config-custom.source
source $BASESTACKPATH/script/func.bash

FUNCVAR_LIST="$DATAPATH/$STACKNAME,nobody:nogroup"
Create_Directory

if [ -n "$CREATE_PATH_LIST" ]; then
	FUNCVAR_LIST=$CREATE_PATH_LIST
	Create_Directory
fi

if [ -n "$CREATE_FILE_LIST" ]; then
	FUNCVAR_LIST=$CREATE_FILE_LIST
	Create_File
fi

#creating the overlay network
if [ -n "$CREATE_NETWORK_LIST" ]; then
	FUNCVAR_LIST=$CREATE_NETWORK_LIST
	Create_Overlay_Network
fi

