#!/bin/sh

#Note folder path
notes_path=$HOME/Documents/Notes
notes_file=TODO.txt

#Create todo.txt file if it doesn't exist
if ! [ -f $notes_path/$notes_file ]
then
	touch $notes_path/$notes_file
fi

op=1

while [ "$op" ]
do
	dmenu_text=$(cat $notes_path/$notes_file)
	dmenu_text+=$'\n---Change File---\n'

	op=$(printf "%s" "$dmenu_text" | dmenu -i -l 5 -p "$notes_file:")

	if [ "$op" == "---Change File---" ]
	then
		#TODO: make it only list regular/.txt files
		notes_file=$(ls -lAh $notes_path | 
			awk '$1 != "total" && /^[^dl]/ {for (i=9; i<NF; i++) printf $i " "; print $NF}' | 
			dmenu -i -l 5 -p "File to read:")
	
	elif grep -Fxq "$op" $notes_path/$notes_file
	then
		sed -i "/^${op}$/d" $notes_path/$notes_file
	
	else
		printf "%s\n" "$op" >> $notes_path/$notes_file
	fi
done

