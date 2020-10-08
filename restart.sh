#!/bin/bash
source config.source

printf "\n"

Check_Domain

printf "********** Traefik Domain: $TRAEFIKDOMAIN \n"
printf "********** Stop and start the Docker Service \n\n"

if [ -z "$1" ]
then
    # Run all the module listed in MODULELIST
    printf "### Stopping all module ###\n" 
    for module in $MODULELIST
    do
    	printf "### Module: $module --->\n"
        (cd $module ;bash stop.bash; cd ..)
	printf "<---\n\n"
    done
    sleep 5
    printf "### Starting all module ###\n" 
    for module in $MODULELIST
    do
    	printf "### Module: $module --->\n"
        (cd $module ;bash start.bash; cd ..)
	printf "<---\n\n"
    done    
else 
    # Only run the given module
    printf "### Module: $1 --->\n"
    (cd $1 ;bash stop.bash; cd ..)
    printf "<---\n\n"
    sleep 5
    printf "### Module: $1 --->\n"
    (cd $1 ;bash start.bash; cd ..)
    printf "<---\n\n"    
fi
