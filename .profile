# VARS #
        export PATH="$PATH:$(du "$HOME/Scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
        export HISTCONTROL=erasedups #erase duplicates from bash history
        export EDITOR="nvim"
        export VISUAL="nvim"
        export TERMINAL="st"
        export BROWSER="firefox"
        export READER="zathura"
        export FILE="vifm"
        export LC_COLLATE="C"
        export MAXIMA_USERDIR=$HOME/.config/maxima

        export MYSCRIPTS="$HOME/Scripts"
        export MYBUILDS="$HOME/Builds"

