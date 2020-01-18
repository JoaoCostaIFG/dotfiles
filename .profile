# important files and directories
export SCRIPTS="$HOME/Scripts/"
export ALIASF="$HOME/.config/aliasrc"
export BASHRC="$HOME/.bashrc"

# add scripts directory recursively to the PATH #
export PATH="$PATH:$(du "$SCRIPTS" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# default programs
export BROWSER="firefox"
export EDITOR="nvim"
export FILE="lfcd_sh"
export OPENER="xdg-open"
export PAGER="less"
export READER="zathura"
export TERMINAL="st"
export VISUAL="nvim"

# clean-up
export LESSHISTFILE="-"
export INPUTRC="$HOME/.config/.inputrc"
export XAUTHORITY="$HOME/.config/.Xauthority"
export MAXIMA_USERDIR="$HOME/.config/maxima"
export HISTCONTROL=ignoreboth:erasedups  #ignore spaces and erase duplicates from bash history
export HISTSIZE=-1  #infinite list size
export HISTFILESIZE=-1  #infinite file size

# other program settings
export LC_COLLATE="C"
export SUDO_ASKPASS="/usr/bin/dpass"
export GPG_TTY=$(tty)
export _JAVA_AWT_WM_NONREPARENTING=1
