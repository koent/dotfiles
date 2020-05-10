#!/usr/bin/bash
id=`xinput list | grep Touchpad | awk '{print $6}' | cut -c 4-`
xinput --set-prop $id 'libinput Natural Scrolling Enabled' 1
xinput --set-prop $id 'libinput Tapping Enabled' 1

