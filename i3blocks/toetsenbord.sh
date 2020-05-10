#!/bin/sh

ru=`xset -q | grep -A 0 'LED' | cut -c63-63`
if [ $ru -eq 1 ]
then
  echo "ru"
  echo "ru"
  echo "#00FF00"
fi
