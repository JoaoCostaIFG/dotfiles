# #
# ~/.bashrc
#


# If not running interactively, don't do anything #
[[ $- != *i* ]] && return


# Use name in terminal
# PS1='[\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


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

