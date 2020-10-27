pecho()
{
  echo "<span color='$1'>W</span>"
}

interface=`nmcli device status | grep "wifi " | awk '{print $1}'`

pecho "$(~/.dotfiles/i3blocks/wifi.sh | tail -n 1)"

while read regel
do
  if [ "$(nmcli radio wifi)" = 'disabled' ]
  then
    pecho "#AAAAAA"
  elif [ "$regel" = "Networkmanager is now in the 'niet verbonden' state" ] || [ "$regel" = "$interface: niet verbonden" ]
  then
    pecho "#FF0000"
  elif [ "$regel" = "Networkmanager is now in the 'verbinden' state" ]
  then
    pecho "#FF8800"
  elif [ "$regel" = "Networkmanager is now in the 'verbonden' state" ]
  then
    pkill -SIGRTMIN+12 i3blocks
    pecho "#FFFFFF"
  fi
done
