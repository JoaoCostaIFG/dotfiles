# #
# ~/.bashrc
#


# If not running interactively, don't do anything #
	[[ $- != *i* ]] && return


# SHELL CONFIGS #
	set -o vi
	shopt -s autocd #Allows you to cd into directory merely by typing the directory name.


# VARS #
	export PS1="\[$(tput setaf 2)\][\[$(tput setaf 1)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 2)\]]\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"

	[[ -f ~/.bash_aliases ]] && source "$HOME/.profile"


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
	[[ -f ~/.bash_aliases ]] && source "$HOME/.bash_aliases"

