# #
# ~/.bashrc
#


# If not running interactively, don't do anything #
[[ $- != *i* ]] && return


# Use name in terminal
PS1='[\u@\h \W]\$ '


# MY FUNCS #
	decompress () {
		if [ -f $1 ] ; then
			case $1 in
	           		*.tar.bz2)   tar xvjf $1    ;;
	           		*.tar.gz)    tar xvzf $1    ;;
	           		*.bz2)       bunzip2 $1     ;;
       		    		*.rar)       unrar x $1     ;;
           			*.gz)        gunzip $1      ;;
           			*.tar)       tar xvf $1     ;;
           			*.tbz2)      tar xvjf $1    ;;
           			*.tgz) 	     tar xvzf $1    ;;
           			*.zip)       unzip $1       ;;
           			*.Z)         uncompress $1  ;;
           			*.7z)        7z x $1        ;;
           			*)           echo "dunno how to extract '$1'" ;;
       			esac
   		else
       			echo "'$1' is not a file"
   		fi
	}

	bashrc () {
		nvim $HOME/.bashrc
		source $HOME/.bashrc
	}


# EXTRA AUTO COMPLETION #
	source /usr/share/bash-completion/completions/git


# VARS #
	export HISTCONTROL=erasedups #erase duplicates from bash history
	export EDITOR="nvim"
	export VISUAL="nvim"
	export TERMINAL="st"
	export BROWSER="firefox"
	export READER="zathura"
	export FILE="vifm"
	export MAXIMA_USERDIR=$HOME/.config/maxima

	export MYSCRIPTS="$HOME/Scripts"
	export MYBUILDS="$HOME/Builds"


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
	alias    maxima='rlwrap -c -H $HOME/.config/maxima/maxima-history -f $HOME/.config/maxima/maxima-builtins-list.txt -r -D 2 maxima'
  	alias    calcurse='calcurse -D $HOME/Documents/calcurse -C $HOME/.config/calcurse'
	#alias    dmen='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"' #call dmenu_run with colors defined by wall in .Xresources
