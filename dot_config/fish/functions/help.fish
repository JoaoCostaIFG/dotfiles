function help
  set path (find "$SCRIPTS"/* -type f -print0 | fzf --read0 --print0)
  [ ! -f "$path" ] && return
  sed -rn 's/^### ?//;T;p' "$path"
end

