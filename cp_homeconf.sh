#!/bin/sh

# directory to get files from
homedir="$HOME"
# directory to copy files to
destdir="$HOME/.config/homedir_conf"

# command line arguments
case "$1" in
  "-i" | "-r")
    temp="$homedir"
    homedir="$destdir"
    destdir="$temp"
    ;;
  *)
    if [ "$1" ]; then
      printf "Unkown option: %s" "$1"
      exit 1
    fi
    ;;
esac

# list of files to copy (can be path's from 'homedir')
file_l=".bash_profile
.bashrc
.profile
.rtorrent.rc
.xinitrc"

printf "Going to copy the following files from %s to %s:\n%s\n" "$homedir" "$destdir" "$file_l"
printf "Do you want to preceed? [Y/n] "
read ans

# exit if answer isn't yes or nothing
if [ "$ans" != "y" ] && [ "$ans" != "Y" ] && [ "$ans" ]; then
  printf "Process aborted by user.\n"
  exit 0
fi

for file in $file_l; do
  if ! test -r "$homedir/$file"; then
    printf "File %s doesn't exist or isn't readable. Skipping..\n" "$homedir/$file"
    continue
  else
    cp "$homedir/$file" "$destdir"
  fi
done
printf "Copying process finished.\n"
