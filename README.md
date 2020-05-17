### Dependencies
    sudo apt install i3 scrot imagemagick jq rofi feh i3blocks compton kdeconnect acpi curl python3-pip playerctl libplayerctl-dev sleepenh plasma-browser-integration

    sudo pip3 install i3ipc pydbus

### Ook handig
    sudo apt install keepassxc lxappearance mutt gimp texlive vlc git htop wine64 neofetch ncdu minizinc minizinc-ide

### Install
1. Clone deze repo

2. Voer `install.sh` uit. 

3. Handmatig wachtwoorden plaatsen in:
- `mutt/ruaccount`, `gmaccount` en `uuaccount`
- `i3blocks/duopass` en `owmappid`

4. Keepass wachtwoorden ergens vandaan halen

5. Inloggen bij Firefox

### Slapen bij klep dicht fixen
In `/etc/UPower/UPower.conf`, verander `IgnoreLid=false` in `IgnoreLid=true`.

In `/etc/systemd/logind.conf`, voeg toe:

    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=suspend
    HandleLidSwitchDocked=suspend
    LidSwitchIgnoreInhibited=no 

Zie ook https://apiraino.github.io/2018/08/06/ubuntu_gnome_power.html
