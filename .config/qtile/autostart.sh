#!/usr/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
picom -b &
xwallpaper --zoom .local/share/wallpaper
ifinstalled -q wal && wal -n -R &
libinput-gestures-setup start &
#setxkbmap -option caps:swapescape & #switch Esc and CapsLock Keys
#blueman-applet &
