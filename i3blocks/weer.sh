#!/bin/sh

if ! wget -q --spider http://google.com
then
  exit
fi
#stadid="2757872" # Culemborg
#stadid="2666199" # Uppsala
#stadid="2750053" # Nijmegen
stadid="2747373" # Den Haag
appid=`cat ~/.config/i3blocks/owmappid`
req="http://api.openweathermap.org/data/2.5/weather?id=$stadid&appid=$appid&lang=nl&units=metric"
res=`curl $req 2> /dev/null`
temp=`echo $res | jq ".main.temp" | sed 's/\./,/g'`
voeltals=`echo $res | jq ".main.feels_like" | sed 's/\./,/g'`
beschr=`echo $res | jq -r ".weather[0].description"`
echo "$temp°C ($voeltals) $beschr"
echo "$temp°C"
