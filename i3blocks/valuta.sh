#!/bin/sh

if ! wget -q --spider http://google.com
then
  exit
fi

val=`echo "scale=3;100/$(curl https://api.exchangeratesapi.io/latest?symbols=SEK 2> /dev/null | jq '.rates.SEK')" | bc | sed 's/\./,/g'`
echo "€$val"
echo "€$val"
