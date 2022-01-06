#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS1="\[\e[35m\][\[\e[m\]\[\e[35m\]\W\[\e[m\]\[\e[35m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] "

[ -r /home/yoda/.byobu/prompt ] && . /home/yoda/.byobu/prompt   #byobu-prompt#

stty -ixon # Disable ctrl-s and ctrl-q
shopt -s autocd #Allows you to cd into dir merely by typing dir name

#set -o vi # Vim in bash

HISTSIZE= HISTFILESIZE= # Infinite history
SAVEHIST=10000
HISTFILE=~/.cache/bash/history

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export MANPAGER="less -R --use-color -Dd+r -Du+b"
export HISTCONTROL=ignoreboth

### Aliases:
# Coloring ->
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

##
alias la='ls -lA --group-directories-first'
alias vim='nvim'
alias dfiles='/usr/bin/git --git-dir=/home/yoda/.dotfiles --work-tree=/home/yoda'
alias p='sudo pacman'
alias yt='yt-dlp -o "/home/yoda/Videos/%(title)s.%(ext)s" --add-metadata -ic $(xclip -o)'
alias yta='yt-dlp -o "/home/yoda/Music/%(title)s.%(ext)s" --add-metadata -xic $(xclip -o)'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

## Dmenu
. $HOME/.scripts/dmenu_color
alias dmenu='dmenu -nb $COLOR_BACKGROUND \
	-nf $COLOR_DEFAULT \
	-sf $COLOR_HIGHLIGHT \
	-sb $SELECTED_BACKGROUND \
	-fn "MononokiNerdFont-20"\
	-i -l 10'

## Window Swallowing
alias mpv='devour mpv'
alias zathura='devour zathura'
alias feh='devour feh'
alias ffplay='devour ffplay'
alias scrcpy='devour scrcpy'

# Import colorscheme from 'wal' asynchronously
(cat ~/.cache/wal/sequences &)
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
