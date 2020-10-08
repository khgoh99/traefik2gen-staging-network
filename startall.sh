#!/bin/bash
for module in $MODULELIST
do
    (cd $module ;bash firsttime.sh)
done
