# This will read the file with environment variables and
# process the lines so they can be run on fish

status --is-login || exit

for x in (sed 's/\s*#.*$//; /^\s*$/d; s/"\$(/(/g; s/)"/)/g;' "$HOME/.profile")
  eval $x
end
