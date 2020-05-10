#!/bin/sh

if ! wget -q --spider http://google.com
then
  exit
fi

cd ~/.mutt/

gm=`python3 gmunread.py`
#ru=`python3 ruunread.py`

#echo "$gm $ru"
#echo "$gm $ru"
echo $gm
echo $gm
