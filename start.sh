#!/bin/bash
source config.source

printf "\n"
if [[ $TRAEFIKDOMAIN == "" ]];
then
        echo "********** TRAEFIKDOMAIN in config.source not set yet."
        echo "********** Please setup config.source first"
	exit 1 
fi

printf "********** Traefik Domain: $TRAEFIKDOMAIN \n"
printf "********** Starting the Docker services \n\n"


if [ -z "$1" ]
then
    # Run all the module listed in MODULELIST
    printf "### Processing all module ###\n" 
    for module in $MODULELIST
    do
        printf "### Module: $module --->\n"
        (cd $module ;bash start.bash; cd ..)
	printf "<---\n\n"
    done
else 
    # Only run the given module
    printf "### Module: $1 --->\n"
    (cd $1 ;bash start.bash; cd ..)
    printf "<---\n\n"
fi
