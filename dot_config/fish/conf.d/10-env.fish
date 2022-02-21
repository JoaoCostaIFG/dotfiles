# This will read the file with environment variables and
# process the lines so they can be run on fish
for x in (sed 's/\s*#.*$//;/^\s*$/d;' "$HOME/.profile")
  set xfish (echo $x | sed 's/"\$(/(/g; s/)"/)/g;')
  eval $xfish
end
