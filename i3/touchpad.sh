#!/usr/bin/bash

# Sets natural scrolling and click on tap for the touchpad
id=`xinput list | grep -i Touchpad | awk '{print $6}' | cut -c 4-`
xinput --set-prop $id 'libinput Natural Scrolling Enabled' 1
xinput --set-prop $id 'libinput Tapping Enabled' 1

