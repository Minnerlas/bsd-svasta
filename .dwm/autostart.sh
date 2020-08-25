#!/bin/sh

xrandr -s 1920x1080 &

slstatus &
setxkbmap -layout rs,rs -variant latin, -option grp:win_space_toggle &
xcompmgr &
~/.fehbg &
