#!/bin/bash
for module in $MODULELIST
do
    echo $module
    (cd $module ;bash firsttime.sh)
done
