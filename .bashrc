# #
# ~/.bashrc
#


# If not running interactively, don't do anything #
[[ $- != *i* ]] && return


# VARS #
# Use name in terminal
# PS1='[\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export HISTCONTROL=erasedups #erase duplicates from bash history
export PATH=$PATH:/home/joao/Scripts
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="vifm"
export LC_COLLATE="C"
export MAXIMA_USERDIR=$HOME/.config/maxima
export WWW_HOME=$HOME/.config/w3m

export MYSCRIPTS="$HOME/Scripts"
export MYBUILDS="$HOME/Builds"


# MY FUNCS #
	bashrc () {
		nvim $HOME/.bashrc
		source $HOME/.bashrc
	}


# EXTRA AUTO COMPLETION #
	source /usr/share/bash-completion/completions/git


# ALIAS #
  	alias    lhome='ls -lAh --color=auto $HOME'
  	alias    ka='killall'
	alias    ls='ls --color=auto'
  	alias    ll='ls -lh --color=auto'
  	alias    lll='ls -lAh --color=auto'
	alias    grep='grep --color=auto'
  	alias    diff='diff --color=auto'
	alias    rm='rm -I'
	alias    nano='nvim'
	alias    clndep='sudo pacman -R $(pacman -Qdtq)'
  	alias    clnrep='sudo paccache -rk1'
  	alias    bye='shutdown now'
	alias    byer='shutdown -r now'
  	alias    raposoflamejante='firefox &'
  	alias    yay='yay --aur'    # prevent partial upgrades
  	alias    calcurse='calcurse -D $HOME/Documents/calcurse -C $HOME/.config/calcurse'
	alias    maxima='rlwrap -c -H $HOME/.config/maxima/maxima-history -f $HOME/.config/maxima/maxima-builtins-list.txt -r -D 2 maxima'
	command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d" # Use neovim for vim if present.

