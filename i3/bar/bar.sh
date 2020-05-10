#!/bin/sh

echo '{"version": 1, "click_events": false, "stop_signal": 20}'
echo '[[]'

nametext() {
  echo "{\"name\": \"$1\", \"full_text\": \"${2}\"}"
  if $3; then
    echo ","
  else
    echo "]"
  fi
}

while :
do
  echo ",["

  volume=`pactl list sinks | grep -P "\tVolume:" | grep -Po "\d+%"| head -1`
  nametext "volume" "$volume"

  load=`cat /proc/loadavg | grep -Po "^\d+\.\d\d"`
  nametext "load" "$load"

  batterij=`cat /sys/class/power_supply/BAT0/capacity`"%"
  nametext "batterij" "$batterij"

  tijd=`date +'%A %d %B %Y  %H:%M:%S'`
  nametext "tijd" "$tijd" false

  sleep 1
done

