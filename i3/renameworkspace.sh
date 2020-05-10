#/bin/sh
huidigenaam=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name'| sed 's/.$//' | sed 's/^...//'`
huidignr=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num'`
nieuwenaam=`rofi -dmenu -p "Nieuwe naam voor $huidignr:$huidigenaam: "`
[ -z "$nieuwenaam" ] && exit # Niets doen als er geen input is
if expr match "$nieuwenaam" "^[0-9]$" >/dev/null # Alleen een cijfer
then
	i3-msg "rename workspace to \"$nieuwenaam:$huidigenaam\""
elif expr match "$nieuwenaam" "^[0-9]:.*$" >/dev/null # Cijfer en naam
then
	i3-msg "rename workspace to \"$nieuwenaam\""
else # Alleen naam
	i3-msg "rename workspace to \"$huidignr:$nieuwenaam\""
fi
