# #
# ~/.bashrc
#


# Vim mode
	set -o vi


# If not running interactively, don't do anything #
	[[ $- != *i* ]] && return


# VARS #
	# PS1='[\u@\h \W]\$ '
	export PS1="\[$(tput setaf 2)\][\[$(tput setaf 1)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 2)\]]\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"
	export HISTCONTROL=erasedups #erase duplicates from bash history
	export PATH=$PATH:$HOME/Scripts
	export EDITOR="nvim"
	export VISUAL="nvim"
	export TERMINAL="st"
	export BROWSER="firefox"
	export READER="zathura"
	export FILE="vifm"
	export LC_COLLATE="C"
	export MAXIMA_USERDIR=$HOME/.config/maxima
	export WWW_HOME=$HOME/.config/w3m
	#export GOPATH=$HOME/go
	#export PATH=$PATH:$GOPATH/bin

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
	if [ -f ~/.bash_aliases ]; then
		. ~/.bash_aliases
	fi

