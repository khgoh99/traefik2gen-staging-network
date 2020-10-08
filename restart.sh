#!/bin/bash
source config.source

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
