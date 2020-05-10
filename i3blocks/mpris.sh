#!/bin/bash
[[ `playerctl status` == "Playing" ]]; playing=$?
artiest=`playerctl metadata -f '{{ lc(artist) }}'`
titel=`playerctl metadata -f '{{ lc(title) }}'`
text="$titel"
[ ! -z "$artiest" ] && text="$artiest: $text"

#text=`playerctl metadata -f '{{ lc(artist) }}: {{ lc(title) }}' | sed 's/|/-/g'`
#t2=`playerctl metadata -f '{{ lc(vlc:nowplaying) }}'`
#[ ! -z "$t2" ] && text=$t2

short=`playerctl status`
echo $text
echo $short
if (( $playing == 1 ))
then
	echo "#AAAAAA"
else
	echo "#FFFFFF"
fi
exit 0
