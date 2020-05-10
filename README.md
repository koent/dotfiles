### Dependencies
    sudo apt install i3 scrot imagemagick jq rofi feh

    sudo pip3 install i3ipc

### Ook handig
    sudo apt install keepassxc python3-pip

### Slapen met klep dicht fixen
In `/etc/UPower/UPower.conf`, verander `IgnoreLid=false` in `IgnoreLid=true`.
In `/etc/systemd/logind.conf`, voeg toe:
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=suspend
    HandleLidSwitchDocked=suspend
    LidSwitchIgnoreInhibited=no 
Zie ook https://apiraino.github.io/2018/08/06/ubuntu_gnome_power.html
