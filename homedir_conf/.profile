# important files and directories
export ALIASF="$HOME/.config/aliasrc"
export BASHRC="$HOME/.bashrc"
export NOTES="$HOME/Documents/Notes"
export SCRIPTS="$HOME/Scripts"

# add scripts directory recursively to the PATH #
export PATH="$(du "$SCRIPTS" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"

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
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
export XAUTHORITY="$HOME/.config/.Xauthority"
export MAXIMA_USERDIR="$HOME/.config/maxima"
export SQLITE_HISTORY="${XDG_DATA_HOME:-"$HOME/.local/share"}/sqlite_history"
export PYTHONSTARTUP="$HOME/.config/pythonrc"

# bash
export HISTCONTROL="ignoreboth:erasedups" # ignore spaces and erase duplicates from bash history
export PROMPT_DIRTRIM=2                   # automatically trim long paths in the prompt (requires Bash 4.x)
export HISTSIZE=-1                        # infinite hist entries
export HISTFILESIZE=-1                    # infinite hist file size
# don't record some commands
export HISTIGNORE="bg:bye:byer:cf:clear:exit:fg:jobs:history:lf:lfcd:startx"

# other program settings
export LC_COLLATE="C"
export LESS="-iFMRSX"
export SUDO_ASKPASS="/usr/bin/dpass"
export GPG_TTY=$(tty)
export _JAVA_AWT_WM_NONREPARENTING=1
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# my scripts
export BIB="$HOME/Documents/WorkRes/bibliography.bib"
export DLINKHANDLER_DOWNDIR="$HOME/Documents"
export DLINKHANDLER_VIDDIR="$HOME/Videos"
export DRECORD_SAVEDIR="$HOME/Videos"
export DTODO_DFLT_FILE="$HOME/Documents/Notes/dtodo_notes/TODO.txt"
export SCREENSHOT_SAVEDIR="$HOME/Pictures/screenshots/"

