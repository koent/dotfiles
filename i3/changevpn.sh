#!/usr/bin/bash

# format "mullvad_NN_CCC.conf"
(builtin cd /etc/openvpn && ls *.conf) | cut -c -14 | rofi -dmenu -p vpn > /home/koen/.dotfiles/i3/vpn.txt
pkill -RTMIN+12 i3blocks
