#!/bin/sh

kb=`df -P -l $HOME | tail -n 1 | awk '{print $4}'`
echo "scale=1;$kb/1024/1024" | bc | sed "s/$/G/g" | sed "s/\./,/g"
echo "$kb/1024/1024" | bc | sed "s/$/G/g"

