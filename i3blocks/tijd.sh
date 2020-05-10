#!/bin/sh

date +'%A %d %B %Y  %H:%M:%S'
secs=`sleepenh 0`
secs=`echo "5-$secs%5" | bc`
sleep $secs

secs=`sleepenh 0`
while :
do
  date +'%A %d %B %Y  %H:%M:%S'
  secs=`sleepenh $secs 5`
done
