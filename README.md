### Dependencies
    sudo apt install i3 scrot imagemagick jq rofi feh i3blocks compton kdeconnect acpi curl python3-pip playerctl libplayerctl-dev sleepenh git

    sudo pip3 install i3ipc pydbus

### Ook handig
    sudo apt install keepassxc lxappearance mutt

### Install
Voer `install.sh` uit. Daarna nog handmatig wachtwoorden plaatsen in:
- `mutt/ruaccount`, `gmaccount` en `uuaccount`
- `i3blocks/duopass` en `owmappid`

### Slapen bij klep dicht fixen
In `/etc/UPower/UPower.conf`, verander `IgnoreLid=false` in `IgnoreLid=true`.

In `/etc/systemd/logind.conf`, voeg toe:

    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=suspend
    HandleLidSwitchDocked=suspend
    LidSwitchIgnoreInhibited=no 

Zie ook https://apiraino.github.io/2018/08/06/ubuntu_gnome_power.html
