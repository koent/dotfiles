#!/usr/bin/env python

import subprocess
import gi
gi.require_version('Playerctl', '2.0')
from gi.repository import Playerctl, GLib
import time

print("blbalbl")

manager = Playerctl.PlayerManager()

def pkill(player=None, _b=None, _c=None):
#	if player.props.player_name == 'spotifyd':
#		time.sleep(2)
	subprocess.run(['pkill', '-SIGRTMIN+10', 'i3blocks'])

def init_player(name):
	player = Playerctl.Player.new_from_name(name)
	player.connect('metadata', pkill, manager)
	player.connect('playback-status::playing', pkill, manager)
	player.connect('playback-status::paused', pkill, manager)
	pkill()
	manager.manage_player(player)

def on_name_appeared(manager, name):
	init_player(name)

manager.connect('name-appeared', on_name_appeared)
manager.connect('player-vanished', pkill)

for name in manager.props.player_names:
	init_player(name)

#https://github.com/altdesktop/playerctl
#https://github.com/altdesktop/playerctl/blob/master/examples/player-manager.py

main = GLib.MainLoop()
main.run()


