#!/bin/sh

ID=`rfkill list bluetooth | head -c 1`
SOFTBLOCKED=`cat /sys/class/rfkill/rfkill$ID/soft`


if [ $SOFTBLOCKED -eq 1 ]; then
	rfkill unblock bluetooth
else
	rfkill block bluetooth
fi
