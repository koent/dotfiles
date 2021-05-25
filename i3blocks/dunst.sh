#!/bin/sh

paused=`dunstctl is-paused`

echo "N"
echo "N"

if [ $paused = true ]; then
   echo "#aaaaaa"
fi;
