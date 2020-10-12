#!/bin/bash
source config.source

WaitTime=8

printf "\n"

Check_Domain

printf "********** Traefik Domain: $TRAEFIKDOMAIN \n"
printf "********** Stop and start the Docker Service \n\n"

arg=$1

if [ -z "$arg" ]
then
    # Run all the module listed in MODULELIST
    printf "### Stopping all module ###\n" 
    for module in $MODULELIST
    do
    	printf "### Module: $module --->\n"
        (cd $module ;bash stop.bash; cd ..)
	printf "<---\n\n"
    done
    Count_Down $WaitTime
    printf "### Starting all module ###\n" 
    for module in $MODULELIST
    do
    	printf "### Module: $module --->\n"
        (cd $module ;bash start.bash; cd ..)
	printf "<---\n\n"
    done    
else 
    # Only run the given module
    printf "### Module: $arg --->\n"
    (cd $arg ;bash stop.bash; cd ..)
    printf "<---\n\n"
    Count_Down $WaitTime
    printf "### Module: $arg --->\n"
    (cd $arg ;bash start.bash; cd ..)
    printf "<---\n\n"    
fi
