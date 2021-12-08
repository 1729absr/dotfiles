#!/usr/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
picom -b &
wal -R &
#feh --randomize --bg-fill '/home/yoda/Pictures/Wallpapers/0040.jpg' &
#setxkbmap -option caps:swapescape & #switch Esc and CapsLock Keys
#blueman-applet &
