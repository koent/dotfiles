#/bin/sh

# Verander de naam van de huidige workspace
# 'n' verandert het nummer in n
# 'n:naam' verandert het nummer in n en de naam in naam
# andere input wordt gezien als de nieuwe naam
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
