function h
  # https://samizdat.dev/help-message-for-shell-scripts/
  sed -rn 's/^### ?//;T;p' "$argv"
end

