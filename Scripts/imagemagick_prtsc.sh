#!/bin/sh

#requires imagemagick
#pass any/amount of argument(s) to make a snipping tool instead

#op=$(printf "Print Screen\nSnipping Tool\n" | dmenu -i -p "What to do:")

ptr_name=$(date '+%d-%m-%y')
if [ -f $HOME/Pictures/screenshots/$ptr_name.png ]
then
	dup_count=$(ls $HOME/Pictures/screenshots/$ptr_name* | wc -l)
	let dup_count+=1
	ptr_name=$ptr_name"_"$dup_count
fi

if [ -z "$1" ]
then
	import -window root $HOME/Pictures/screenshots/$ptr_name.png
	notify-send -u low "Print Screen" "Print saved to ~/Pictures/screenshots"
else
	import $HOME/Pictures/screenshots/$ptr_name.png
	notify-send -u low "Snipping Tool" "Snip saved to ~/Pictures/screenshots"
fi

