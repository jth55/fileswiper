#!/bin/bash

sport=443
dport=80

# Makes loot directory in the current path unless it already exists
if ! [ -d "loot/" ] ; then
        mkdir loot/
fi

#Go through a loop of each item in the loot and a port number
while true ; do
        echo "Opening a info listener on port $sport"
        filename=$(nc -l -p $sport -q 0.1 | tr "/" "_") 
        exit_code=$?
        if [ $exit_code -ne 0 ] ;
        then
                echo "exiting..."
                exit 0
        fi
        echo "Opening a data listener on port $dport"
        nc -l -p $dport -q 0.1 > "loot/$filename"
done
