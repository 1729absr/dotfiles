#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1="\[\e[35m\][\[\e[m\]\[\e[35m\]\W\[\e[m\]\[\e[35m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] "
[ -r /home/yoda/.byobu/prompt ] && . /home/yoda/.byobu/prompt   #byobu-prompt#

##
stty -ixon	# Disable ctrl-s and ctrl-q
shopt -s autocd	# Allows you to cd into dir merely by typing dir name
#set -o vi	# Vim in bash

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/bash/history

source $HOME/.config/shell/aliases

source ~/.cache/wal/colors-tty.sh

# Prompt
eval "$(starship init bash)"
