!/usr/bin/sh

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom -b &
nm-applet &
xwallpaper --zoom .local/share/wallpaper &
ifinstalled -q wal && [ -d "$HOME/.cache/wal" ] && wal -n -R &
# /usr/share/X11/xkb/rules/xorg.lst
setxkbmap -option caps:escape_shifted_capslock
redshift-gtk &
blueberry-tray &
xbanish &
