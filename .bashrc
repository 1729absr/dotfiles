#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
BLUE="\[\e[38;2;150;100;250m\]"
ORANGE="\[\e[38;2;250;150;50m\]"
PS1="${BLUE}\W${ORANGE}:\[\e[m\] "
unset BLUE
unset ORANGE

[ -r /home/yoda/.config/byobu/prompt ] && . /home/yoda/.config/byobu/prompt   #byobu-prompt#

stty -ixon	# Disable ctrl-s and ctrl-q
shopt -s autocd	# Allows you to cd into dir merely by typing dir name
set -o vi	# Vi key-bindings in bash

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/bash/history

source $HOME/.config/shell/aliases
source $XDG_DATA_HOME/python_venv/bin/activate

[ -d ~/.cache/wal ] && source ~/.cache/wal/colors-tty.sh
