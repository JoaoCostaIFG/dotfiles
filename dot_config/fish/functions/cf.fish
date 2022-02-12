function cf
  set -l inputStr "$argv"
  find "$SCRIPTS"/* "$HOME/.config"/* -type f -print0 |
    fzf --read0 --print0 -q "$inputStr" |
    xargs -r -0 "$EDITOR"
end

