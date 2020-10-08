#!/bin/bash
source config.source

if [[ $TRAEFIKDOMAIN == "" ]];
then
        echo "**** TRAEFIKDOMAIN in config.source not set yet."
	    echo "**** Please setup config.source first"
	exit 1 
else
        echo "Domain is at $TRAEFIKDOMAIN"
fi

if [ -z "$1" ]
then
    # Run all the module listed in MODULELIST
    for module in $MODULELIST
    do
        (cd $module ;bash firsttime.sh)
    done
else 
    # Only run the given module
    (cd $1 ;bash firsttime.sh)
fi
