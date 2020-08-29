#!/bin/sh

xrandr -s 1920x1080 &

slstatus &
setxkbmap -layout rs,rs -variant latin, -option grp:win_space_toggle &
xcompmgr &
~/.fehbg &
doas wsconsctl mouse.reverse_scrolling=1
doas wsconsctl mouse.tp.tapping=1

