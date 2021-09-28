### Dependencies
    sudo apt install git i3 scrot imagemagick jq rofi feh i3blocks compton kdeconnect acpi curl python3-pip playerctl libplayerctl-dev sleepenh plasma-browser-integration libpango1.0-dev

    sudo pip3 install i3ipc pydbus

### Ook handig
    sudo apt install keepassxc lxappearance gimp texlive vlc htop wine64 neofetch ncdu minizinc minizinc-ide youtube-dl units xournal toilet d-feet audacity pandoc openjdk-11-jdk openssh-server lm-sensors ibus-table-latex xboxdrv translate-shell pavucontrol blueman

### Install
1. Installeer de dependencies

2. Clone deze repo in `/home/koen`

3. Verander de naam van `dotfiles` in `.dotfiles`

4. Voer `install.sh` uit. 

5. Handmatig wachtwoorden plaatsen in:
- `mutt/ruaccount`, `mutt/gmaccount` en `mutt/uuaccount`
- `i3blocks/duopass` en `i3blocks/owmappid`

6. Keepass wachtwoorden ergens vandaan halen

7. Inloggen bij Firefox

8. De map `open-sans` in `/usr/share/fonts/truetype/` plaatsen

9. Checken of Dunst >1.5 is geinstalleerd (`dunst -v`). Zoniet: Installatieinstructies op https://github.com/dunst-project/dunst/ volgen met WAYLAND=0

10. `. "$HOME/.dotfiles/profile.sh"` toevoegen onder .profile.   `. "$HOME/.dotfiles/bashrc.sh"` toevoegen onder .bashrc

12. `sudo visudo` uitvoeren en `%sudo ALL=(root) NOPASSWD: /home/koen/.dotfiles/bin/writebrightness.sh` onderaan toevoegen

13. kde-connect instellen: `kde-connect -l`, goede code zoeken, `kde-connect --pair -d code`

14. Uitloggen en inloggen met i3

### Slapen bij klep dicht fixen
In `/etc/UPower/UPower.conf`, verander `IgnoreLid=false` in `IgnoreLid=true`.

In `/etc/systemd/logind.conf`, voeg toe:

    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=suspend
    HandleLidSwitchDocked=suspend
    LidSwitchIgnoreInhibited=no 

Zie ook ~~https://apiraino.github.io/2018/08/06/ubuntu_gnome_power.html~~ https://apiraino.github.io/ubuntu-gnome-power/

### Niet uitschakelen als je op de aanknop drukt
In `/etc/systemd/logind.conf`, voeg `HandlePowerKey=ignore` toe.
