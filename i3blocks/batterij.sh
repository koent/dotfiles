#!/bin/sh

teller=`cat /sys/class/power_supply/BAT0/charge_now`
noemer=`cat /sys/class/power_supply/BAT0/charge_full_design`
percentage=`echo "scale=2;$teller*100/$noemer" | bc | sed 's/\./,/g'`
eta=`acpi | awk '{print $5}'`
eta=" $eta"
if acpi | grep Charging > /dev/null
then
  opladen="↑"
elif acpi | grep "Not charging" > /dev/null
then
  opladen=""
  eta=""
else
  opladen="↓"
fi



echo "$percentage%$opladen$eta"
echo "$percentage%$opladen"
percentageafg=`echo "$teller*100/$noemer" | bc | sed 's/\./,/g'`
if [ $percentageafg -le 11 -a "$opladen" = "↓" ]; then
  echo "#FF0000"
fi
if [ "$eta" = "" ]; then
  echo "#00FF00"
fi
