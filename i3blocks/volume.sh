#!/bin/sh

out=`pactl list sinks | grep -P "\tVolume:" | tail -n 1 | grep -Po "\d+%"| head -1`
#                                             XXXXXXX
# Het is gewoon toeval dat de goede sink de laatste is

echo $out
echo $out

if pactl list sinks | grep Mute | tail -n 1 | grep ja > /dev/null
then
  echo "#aaaaaa"
fi

exit 0
