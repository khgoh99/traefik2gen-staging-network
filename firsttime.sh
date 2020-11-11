#!/bin/bash
source config.source
source $BASESTACKPATH/script/func.bash

printf "\n"

if [ ! -d "$SYSTEMROOT" ] 
then
 printf "Directory SYSTEMROOT $SYSTEMROOT Does Not Exists.\n" 
 printf "Please make sure this script is execute from the fileserver or NFS hosting the data files if want to create.\n"
 printf "\n if SYSTEMROOT not available, it will only create the Docker network.\n"
 printf "\n"
fi


Check_Domain

printf "********** Traefik Domain: $TRAEFIKDOMAIN \n"
printf "********** Doing first time configuration \n\n"

if [ ! -d "$DATAPATH" ]
then
	mkdir -p $DATAPATH
	chown -R nobody:nogroup $DATAPATH
fi

if [ -z "$1" ]
then
    # Run all the module listed in MODULELIST
    printf "### Processing all module ###\n" 
    for module in $MODULELIST
    do
        printf "### Module: $module --->\n"
        (cd $module ;bash firsttime.bash; cd ..)
	printf "<---\n\n"
    done
else 
    # Only run the given module
    printf "### Module: $1 --->\n"
    (cd $1 ;bash firsttime.bash; cd ..)
    printf "<---\n\n"
fi
