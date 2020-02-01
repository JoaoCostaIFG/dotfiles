# #
# ~/.bashrc
#

# If not running interactively, don't do anything #
[[ $- != *i* ]] && return

# SHELL CONFIGS #
# set umask
# umask 077

# vim mode
set -o vi

# allows you to cd into directory merely by typing the directory name.
shopt -s autocd

# Update window size after every command
shopt -s checkwinsize

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# VARS #
export PS1="\[$(tput setaf 2)\][\[$(tput setaf 1)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 2)\]]\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"

# MY FUNCS #
# edit and source ~/.bashrc
bashrc () {
  nvim $HOME/.bashrc
  source $HOME/.bashrc
}

aliasrc () {
  nvim $HOME/.config/aliasrc
  source $HOME/.bashrc
}

# opens lf and cd's to the current folder on exit
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
# source /usr/share/bash-completion/completions/git

# ALIAS #
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
