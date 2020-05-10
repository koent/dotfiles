#/bin/sh

interface=`nmcli device status | grep "wifi " | awk '{print $1}'`

echo "W"
echo "W"

if [ "$(nmcli radio wifi)" = 'disabled' ]
then
  echo "#AAAAAA"
  exit
fi
if [ "$(cat /sys/class/net/$interface/operstate)" = 'down' ]
then
  echo "#FF0000"
  exit
fi
if [ "$(cat /sys/class/net/$interface/operstate)" != 'up' ]
then
  echo "#FF8800"
else
  echo "#FFFFFF"
fi
