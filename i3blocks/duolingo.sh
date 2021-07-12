#!/bin/sh

if ! wget -q --spider http://google.com
then
  exit
fi

user=".koen"
pass=`cat ~/.config/i3blocks/duopass`
comb="login=$user&password=$pass"

if curl -s -d $comb -c /tmp/duocookies https://www.duolingo.com/login | grep response | grep OK > /dev/null
then
  res=`curl -b /tmp/duocookies https://www.duolingo.com/users/$user 2> /dev/null`
  printf '%s' $res | jq ".site_streak"
  printf '%s' $res | jq ".site_streak"
else
  echo "?"
  echo "?"
fi

if [ `printf '%s' $res | jq ".streak_extended_today"` != "true" ]
then
  echo "#FF0000"
fi



rm /tmp/duocookies
