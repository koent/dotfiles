#! /bin/bash

cd "/home/koen/.dotfiles/bin"
source configuration.sh
if [ -z "$1" ]
then
	value=$maxBright
else
  if [ $1 -gt $maxBright ]
  then
    value=$maxBright
  elif [ $1 -lt $minBright ]
  then
    value=$minBright
  else
	  value=$1
  fi
fi
echo "changing brightness to:"
echo $value | sudo tee $brightFolder"brightness"
