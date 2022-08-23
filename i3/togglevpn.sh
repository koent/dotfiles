#!/bin/bash

config="mullvad_be_bru"
source <(systemctl show openvpn@$config --no-page | grep ActiveState) # fills ActiveState


if [ $ActiveState = "active" ]; then
	sudo systemctl stop openvpn@$config
	pkill -RTMIN+12 i3blocks
	echo "uit"
else
	sudo systemctl start openvpn@$config
	pkill -RTMIN+12 i3blocks
	echo "aan"
fi
