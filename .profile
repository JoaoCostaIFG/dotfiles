# Add ~/Scripts to the PATH #
export PATH="$PATH:$(du "$HOME/Scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs
export BROWSER="firefox"
export EDITOR="nvim"
export FILE="vifm"
export OPENER="xdg-open"
export PAGER="less"
export READER="zathura"
export TERMINAL="st"
export VISUAL="nvim"

# Clean-up
export LESSHISTFILE="-"
export INPUTRC="$HOME/.config/.inputrc"
export XAUTHORITY="$HOME/.config/.Xauthority"
export MAXIMA_USERDIR="$HOME/.config/maxima"
export HISTCONTROL=ignoreboth:erasedups  #ignore spaces and erase duplicates from bash history
export HISTSIZE=-1  #infinite list size
export HISTFILESIZE=-1  #infinite file size

# Other program settings
export LC_COLLATE="C"
export SUDO_ASKPASS="/usr/bin/dpass"
export GPG_TTY=$(tty)
export _JAVA_AWT_WM_NONREPARENTING=1
