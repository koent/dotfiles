#!/usr/bin/bash

config=`cat $HOME/.dotfiles/i3/vpn.txt`
country=`echo "$config" | cut -c 9-10`
country=${country^^}
fst=$((`printf '%d' "'${country:0:1}"` + 127397))
snd=$((`printf '%d' "'${country:1:1}"` + 127397))
country_emoji="\U$(printf '%x' $fst)\U$(printf '%x' $snd)"

source <(systemctl show openvpn@$config --no-page | grep ActiveState) # fills ActiveState

if [ $ActiveState = "active" ]; then
	echo -e "$country_emoji"
	echo -e "$country_emoji"
	echo "#00ff00"
else
	echo "$country"
	echo "$country"
	echo "#aaaaaa"
fi;
