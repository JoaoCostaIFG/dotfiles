#!/bin/sh

scripts_dir="scripts/"
outfile="${scripts_dir}/README.md"

printf "%s\n\n" "# Scripts" >"$outfile"

for f in $(find "$scripts_dir" -type f | sed "s|^${scripts_dir}||"); do
  desc="$(h "${scripts_dir}/${f}")"
  if [ "$desc" ]; then
    # only do something if there's a description for the script
    printf "%s\n\n%s\n\n" "# Scripts" "$desc" >>"$outfile"
  fi
done
