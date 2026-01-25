# find package and install it
function fpkg --description 'Search for a package in the Official and AUR repos, and install it'
    set pkg (fish -c 'pacman -Slq && paru -Slq' | fzf | string collect; or echo)
    [ -z "$pkg" ] && return 0
    if pacman -Slq | grep -q -w '^'"$pkg"'$'
        sudo pacman -Syu "$pkg"
    else
        paru -Syu "$pkg"
    end
end
