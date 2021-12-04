#!/usr/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
#blueman-applet &
feh --randomize --bg-fill '/home/yoda/Pictures/Wallpapers/0393.jpg' &
picom -b &
#setxkbmap -option caps:swapescape & #switch Esc and CapsLock Keys
