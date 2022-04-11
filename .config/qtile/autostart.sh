#!/usr/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
picom -b &
xwallpaper --zoom $(cat "${HOME}/.cache/wal/wal")
wal -n -R &
#setxkbmap -option caps:swapescape & #switch Esc and CapsLock Keys
#blueman-applet &
