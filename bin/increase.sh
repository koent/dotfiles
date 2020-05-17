#! /bin/bash

cd "/home/koen/.dotfiles/bin"
source configuration.sh
sudo ./writebrightness.sh `expr $currentBright "*" $teller / $noemer`
