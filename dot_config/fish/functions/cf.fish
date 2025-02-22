function cf --argument inputStr --description "Edit a dotfile repo"
    find "$HOME/.dotfiles" -maxdepth 4 -type f -print0 | fzf --read0 --print0 -q "$inputStr" | xargs -r -0 "$EDITOR"
end
