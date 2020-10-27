pecho()
{
  echo "<span color='$1'>B</span>"
}

ID=`rfkill list bluetooth | head -c 1`

#pecho "$(~/.dotfiles/i3blocks/bluetooth.sh | tail -n 1)"

while read regel
do
	SOFTBLOCKED=`cat /sys/class/rfkill/rfkill$ID/soft`
	if [ $SOFTBLOCKED -eq 1 ]; then
		pecho "#AAAAAA"
	else
		pecho "#FFFFFF"
	fi
done
