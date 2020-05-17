#! /bin/bash

brightFolder="/sys/class/backlight/intel_backlight/"
currentBright=`cat $brightFolder"brightness"`
maxBright=`cat $brightFolder"max_brightness"`
minBright=$((maxBright / 100))
teller=5
noemer=4
