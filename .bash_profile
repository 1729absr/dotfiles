#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.local/bin:$HOME/.scripts
export TERM=xterm-256color
export EDITOR="nvim"
export BROWSER="firefox"
#export BROWSER="qutebrowser"
export READER="zathura"
export QT_QPA_PLATFORMTHEME=qt5ct

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# CleanUp $HOME
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Start GUI
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
