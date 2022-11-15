!/usr/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
#picom -b &
xwallpaper --zoom .local/share/wallpaper &
#swaybg -i $HOME/.local/share/wallpaper -m fill &
ifinstalled -q wal && [ -d "$HOME/.cache/wal" ] && wal -n -R &
# /usr/share/X11/xkb/rules/xorg.lst
setxkbmap -option caps:escape_shifted_capslock
#blueman-applet &
