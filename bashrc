# #
# ~/.bashrc
# source for many options: https://github.com/mrzool/bash-sensible
#

# If not running interactively, don't do anything #
[[ $- != *i* ]] && return

# GENERAL CONFIGS #
# umask 077
set -o vi

# Update window size after every command
shopt -s checkwinsize

# TAB-COMPLETION #
# allows you to cd into directory merely by typing the directory name.
shopt -s autocd 2>/dev/null
# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# HISTORY #
# append history file
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist
# Record each line as it gets issued and print %+newline after commands with
# no trailing new line finish (https://www.vidarholen.net/contents/blog/?p=878)
PROMPT_COMMAND='history -a; printf "%%%$((COLUMNS-1))s\\r"'

# VARS #
RT="\[$(tput sgr0)\]" # reset
BD="\[$(tput bold)\]" # bold
C1="\[$(tput setaf 1)\]"
C2="\[$(tput setaf 2)\]"
# C3="\[$(tput setaf 5)\]"
C4="\[$(tput setaf 6)\]"
# export PS1="${BD}${C2}[${C1}\u${C4}@\h${C3} \W${C2}]\$ ${RT}"
export PS1="${BD}${C1}[${C4}\W${C1}]${C2}<>< ${RT}"

# ALIAS #
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

shortcuts 2>/dev/null
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
