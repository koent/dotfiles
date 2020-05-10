#!/bin/sh

out=`pactl list sinks | grep -P "\tVolume:" | grep -Po "\d+%"| head -1`

echo $out
echo $out

if pactl list sinks | grep Mute | head -1 | grep ja > /dev/null
then
  echo "#aaaaaa"
fi

exit 0
