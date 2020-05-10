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

block() {
  val=`cat $1`
  echo "{\"name\": \"$1\", \"full_text\": \"${val}\"}"
  if $2; then
    echo ","
  else
    echo "]"
  fi
}

cd "/home/koen/.config/i3/bar"

while :
do
  echo ",["
  secs=`date +'%S'`

  if [ `expr $secs % 5` -eq 0 ]
  then
    date +'%A %d %B %Y  %H:%M:%S' > tijd &
#    (
#      if pactl list sinks | grep Mute | head -1 | grep nee > /dev/null
#      then
#        echo "0%" > volume
#      else
#        pactl list sinks | grep -P "\tVolume:" | grep -Po "\d+%"| head -1 > volume
#      fi
#    ) &
  fi

  if [ `expr $secs % 15` -eq 0 ]
  then
    cat /proc/loadavg | grep -Po "^\d+\.\d\d" | sed 's/\./,/g' > load &
#    echo "scale=2;`cat /sys/class/power_supply/BAT0/charge_now`*100/`cat /sys/class/power_supply/BAT0/charge_full_design`" | bc | sed 's/$/%/g' | sed 's/\./,/g' > batterij &
    false
  fi

  sleep 0.2

#  block volume
  block load
#  block batterij
  block tijd false

  sleep 4.8
done
