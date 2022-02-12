function notes
  find "$NOTES"/* -type f -print0 | fzf --read0 --print0 |
    xargs -r -0 "$EDITOR"
end

