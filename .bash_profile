#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.local/bin:$HOME/.local/bin/scripts
export HISTCONTROL=ignoreboth
#export TERM=xterm-256color
export TERM='st'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="st"
export READER="zathura"
export QT_QPA_PLATFORMTHEME=qt5ct
export RANGER_LOAD_DEFAULT_RC=FALSE

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# CleanUp $HOME
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export RANDFILE="$XDG_CONFIG_HOME/rnd"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"

# Margin
export GAP=8

# Start GUI
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi
