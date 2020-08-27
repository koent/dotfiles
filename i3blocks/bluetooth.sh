#!/bin/sh

#status=`rfkill -J | jq -r '.""[] | select(.type == "bluetooth") | .soft'`
status=`rfkill list bluetooth  -o SOFT -n`

echo "B"
echo "B"
if [ $status = "blocked" ]
then
  echo "#AAAAAA"
else
  echo "#FFFFFF"
fi
