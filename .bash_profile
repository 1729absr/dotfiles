#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.local/bin:$HOME/.local/bin/scripts
export HISTCONTROL=ignoreboth
export TERM="st"
export TERMINAL="st"
export MANPAGER="less --mouse -R --use-color -Dd+r -Du+b"
export EDITOR="nvim"
export BROWSER="firefox"
export READER="zathura"
# export QT_QPA_PLATFORMTHEME=qt5ct
export RANGER_LOAD_DEFAULT_RC=FALSE
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export BIB="/home/yoda/main/writing/uni.bib"
export MOZ_ENABLE_WAYLAND=1 firefox
export GTK_THEME=Breeze:dark

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
export ANDROID_HOME="$XDG_DATA_HOME"/android
# export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"

# Start GUI
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx "$XDG_CONFIG_HOME/X11/xinitrc" --vt1 &> /dev/null
  # exec qtile start -b wayland
fi
