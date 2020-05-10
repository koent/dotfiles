dependencies:
i3 

Ook handig:
keepassxc 

Slapen met klep dicht fixen:
In /etc/UPower/UPower.conf, verander IgnoreLid=false to IgnoreLid=true
In /etc/systemd/logind.conf, voeg toe:
 HandleLidSwitch=suspend
 HandleLidSwitchExternalPower=suspend
 HandleLidSwitchDocked=suspend
 LidSwitchIgnoreInhibited=no 
(https://apiraino.github.io/2018/08/06/ubuntu_gnome_power.html)
