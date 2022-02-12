# important files and directories
set -gx ALIASF "$HOME/.config/aliasrc"
set -gx BASHRC "$HOME/.bashrc"
set -gx NOTES "$HOME/Documents/Notes"
set -gx SCRIPTS "$HOME/.local/bin"

# add scripts directory recursively to the PATH #
set -gx --path PATH (du "$SCRIPTS" | cut -f2 | tr '\n' ':' | sed 's/:total:$//') $PATH

# default programs
set -gx BROWSER "firefox"
set -gx EDITOR "nvim"
set -gx FILE "lfcd_sh"
set -gx OPENER "xdg-open"
set -gx PAGER "less"
set -gx READER "zathura"
set -gx TERMINAL "st"
set -gx VISUAL "nvim"
set -gx NACHOS "cute"

# clean-up
set -gx GTK2_RC_FILES "$HOME/.config/gtk-2.0/gtkrc-2.0"
set -gx LESSHISTFILE "-"
set -gx WGETRC "$HOME/.config/wget/wgetrc"
set -gx INPUTRC "$HOME/.config/inputrc"
#set -gx XAUTHORITY "$HOME/.config/.Xauthority" # sometimes causes problems
set -gx MAXIMA_USERDIR "$HOME/.config/maxima"
set -gx SQLITE_HISTORY "$HOME/.local/share/sqlite_history"
set -gx PYTHONSTARTUP "$HOME/.config/pythonrc"

# bash
set -gx HISTCONTROL "ignoreboth:erasedups" # ignore spaces and erase duplicates from bash history
set -gx PROMPT_DIRTRIM 2                   # automatically trim long paths in the prompt (requires Bash 4.x)
set -gx HISTSIZE -1                        # infinite hist entries
set -gx HISTFILESIZE -1                    # infinite hist file size
# don't record some commands
set -gx HISTIGNORE "bg:bye:byer:cf:clear:exit:fg:jobs:history:lf:lfcd:startx"

# other program settings
set -gx LC_COLLATE "C"
set -gx LESS "-iFMRSX"
set -gx SUDO_ASKPASS "/usr/bin/dpass"
set -gx GPG_TTY (tty)
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 40%"

# theming
set -gx QT_QPA_PLATFORMTHEME "qt5ct"

# my scripts
set -gx BIB "$HOME/Documents/WorkRes/bibliography.bib"
set -gx DLINKHANDLER_DOWNDIR "$HOME/Documents"
set -gx DLINKHANDLER_VIDDIR "$HOME/Videos"
set -gx DRECORD_SAVEDIR "$HOME/Videos"
set -gx DTODO_DFLT_FILE "$HOME/Documents/Notes/dtodo_notes/TODO.txt"
set -gx SCREENSHOT_SAVEDIR "$HOME/Pictures/screenshots/"

