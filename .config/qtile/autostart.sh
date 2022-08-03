#!/usr/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
picom -b &
xwallpaper --zoom .local/share/wallpaper &
ifinstalled -q wal && [ -d "$HOME/.cache/wal" ] && wal -n -R &
setxkbmap -option caps:swapescape & #switch Esc and CapsLock Keys
#blueman-applet &
