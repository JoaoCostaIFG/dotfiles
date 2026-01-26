# zoxide
status is-interactive || exit

if command -v zoxide >/dev/null
    zoxide init fish | source

    # redefine cd to use zoxide
    alias cd='z'
    alias dc='z -'
    abbr -a -- cdi zi
end
