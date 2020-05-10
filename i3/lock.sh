scrot /tmp/screen.png
#convert /tmp/screen.png -colorspace Gray -blur 0x5 /tmp/screen6.png
convert /tmp/screen.png -colorspace Gray -scale 10% -scale 1000% /tmp/screen6.png
i3lock -i /tmp/screen6.png
