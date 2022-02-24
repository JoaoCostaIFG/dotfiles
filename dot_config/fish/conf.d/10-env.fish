# This will read the file with environment variables and
# process the lines so they can be run on fish

status --is-login || exit

sed 's/\s*#.*$//; /^\s*$/d; s/"\$(/(/g; s/)"/)/g;' "$HOME/.profile" | source
