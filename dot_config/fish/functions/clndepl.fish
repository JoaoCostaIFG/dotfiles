function clndepl --description 'Recursively remove pacman dangling dependencies'
    while true
        clndep --noconfirm || return 0
    end
end
