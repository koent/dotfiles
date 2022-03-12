#!/bin/sh

teller=`cat /sys/class/power_supply/BAT0/charge_now`
noemer=`cat /sys/class/power_supply/BAT0/charge_full`
percentage=`echo "scale=2;$teller*100/$noemer" | bc | sed 's/\./,/g'`
eta=`acpi | awk '{print $5}'`
eta=" $eta"

if acpi | grep "Not charging" > /dev/null || acpi | grep "charging at zero rate" > /dev/null
then
  opladen=""
  eta=""
elif acpi | grep Charging > /dev/null
then
  opladen="↑"
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
