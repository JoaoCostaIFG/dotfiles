# #
# ~/.bashrc
#


# If not running interactively, don't do anything #
	[[ $- != *i* ]] && return


# Vim mode
	set -o vi


# VARS #
	# PS1='[\u@\h \W]\$ '
	export PS1="\[$(tput setaf 2)\][\[$(tput setaf 1)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 2)\]]\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"
	export HISTCONTROL=erasedups #erase duplicates from bash history
	export PATH=$PATH:$HOME/Scripts
	export SUDO_ASKPASS="/usr/bin/dpass"
	export LC_COLLATE="C"
	export EDITOR="nvim"
	export VISUAL="nvim"
	export TERMINAL="st"
	export BROWSER="firefox"
	export READER="zathura"
	export FILE="vifm"
	export MAXIMA_USERDIR=$HOME/.config/maxima
	export GPG_TTY=$(tty)
	export _JAVA_AWT_WM_NONREPARENTING=1

	export MYSCRIPTS="$HOME/Scripts"
	export MYBUILDS="$HOME/Builds"


# MY FUNCS #
	# Edit and source ~/.bashrc
	bashrc () {
		nvim $HOME/.bashrc
		source $HOME/.bashrc
	}

	# Opens lf and cd's to the current folder on exit
	lfcd () {
		tmp="$(mktemp)"
		lf -last-dir-path="$tmp" "$@"
		if [ -f "$tmp" ]; then
			dir="$(cat "$tmp")"
			rm -f "$tmp"
			
			[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
		fi
	}
	bind '"\ef":"lfcd\C-m"'


# EXTRA AUTO COMPLETION #
	source /usr/share/bash-completion/completions/git


# ALIAS #
	if [ -f ~/.bash_aliases ]; then
		. ~/.bash_aliases
	fi

