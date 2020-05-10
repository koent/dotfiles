#!/usr/bin/env python

import i3ipc
import subprocess
import signal
import sys

wallpaper_name = 'CGPGrey' #'pA4nMSi'
dir = sys.path[0]+'/wallpapers/'

empty_wallpaper = dir+wallpaper_name+'.jpg'
full_wallpaper =  dir+wallpaper_name+'_25.jpg'
i3 = i3ipc.Connection()

def update_wallpaper():
    if len(i3.get_tree().find_focused().workspace().leaves()) == 0:
        wallpaper = empty_wallpaper
    else:
        wallpaper = full_wallpaper
    subprocess.run(['feh', '--bg-scale', wallpaper])

def signal_handler(signal, frame):
    subprocess.run(['feh', '--bg-scale', empty_wallpaper])
    i3.main_quit()
    sys.exit(0)
signal.signal(signal.SIGINT, signal_handler)
signal.signal(signal.SIGTERM, signal_handler)

def on_change(i3, e):
    if e.change in ['focus', 'new', 'close', 'move']:
        update_wallpaper()

i3.on('workspace', on_change)
i3.on('window', on_change)
i3.main()
