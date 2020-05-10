#!/usr/bin/bash
held=`cat /sys/class/backlight/intel_backlight/brightness`
held=`echo "$held/1000" | bc`
held=$(printf "%02d" $held)
echo "$held"
echo "$held"
