#!/usr/bin/bash

config="mullvad_be_bru"
country=`echo "$config" | cut -c 9-10`
country=${country^^}

source <(systemctl show openvpn@$config --no-page | grep ActiveState) # fills ActiveState
case $country in
	BE)
	country="🇧🇪️"
	;;
esac

if [ $ActiveState = "active" ]; then
	echo "$country"
	echo "$country"
	echo "#00ff00"
else
	echo "V"
	echo "V"
	echo "#aaaaaa"
fi;
