#!/bin/bash
source config.source
source $BASESTACKPATH/script/func.bash

printf "\n"

Check_Domain

printf "********** Traefik Domain: $TRAEFIKDOMAIN \n"
printf "********** Doing first time configuration \n\n"


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
