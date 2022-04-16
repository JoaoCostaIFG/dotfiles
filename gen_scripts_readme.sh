#!/bin/sh

scripts_dir="scripts/"
outfile="${scripts_dir}/README.md"
rm -f "$outfile"

tmpfile="$(mktemp)"
printf "%s\n\n" "# Scripts" >"$tmpfile"

for f in $(find "$scripts_dir" -type f | sort | sed "s|^${scripts_dir}||"); do
  desc="$(sed -rn 's/^### ?//;T;p' "${scripts_dir}/${f}")"
  if [ "$desc" ]; then
    # only do something if there's a description for the script
    printf "%s\n\n%s\n\n" "## ${f}" "${desc}" >>"$tmpfile"
  else
    echo "Warning: script ${f} is missing a description."
  fi
done

mv "$tmpfile" "$outfile"
