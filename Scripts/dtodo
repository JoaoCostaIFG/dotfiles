#!/bin/sh

switch_file () {
	#Open another file for editing (if the selected name doesn't exist, a file is created)

	notes_file_temp=$(ls -lAh $notes_path |
                awk '$1 != "total" && /^[^dl]/ {for (i=9; i<NF; i++) printf $i " "; print $NF}' |
                dmenu -i -l 5 -p "File to read:")
        if [ "$notes_file_temp" ]
        then
                existance=$(ls -lAh $notes_path |
                        awk '$1 != "total" && /^[^dl]/ {for (i=9; i<NF; i++) printf $i " "; print $NF}' |
                        awk -v cmp_var="$notes_file_temp" '$0 == cmp_var')

                if ! [ "$existance" ]
                then
			#Notification sounded like a good idea but they are hidden by dmenu on the top of the screen
                        touch "$notes_path/$notes_file_temp"
			#notify-send -u low "$notes_file created."

                fi

                notes_file="$notes_file_temp"

        fi
}


#Note folder path
notes_path="$HOME/Documents/Notes"
notes_file="TODO.txt"

#Create todo.txt file if it doesn't exist
if ! [ -f $notes_path/$notes_file ]
then
	touch "$notes_path/$notes_file"
fi

op=1

while [ "$op" ]
do
	#dmenu_text=$(cat $notes_path/$notes_file)
	dmenu_text=$(grep -ve '^[[:space:]]*$' "$notes_path/$notes_file")
	if [ "$dmenu_text" ]
	then
		dmenu_text+=$'\n---Switch File---\n---Clean File---\n---Delete File---\n'
	else
		dmenu_text+=$'---Switch File---\n---Clean File---\n---Delete File---\n'
	fi

	op=$(printf "%s" "$dmenu_text" | dmenu -i -l 5 -p "$notes_file:")
	
	if [ "$op" == "---Switch File---" ]
	then
		switch_file
			
        elif [ "$op" == "---Clean File---" ]
        then
		#Sort and remove blank and duplicate lines from current file
		tempfile=$(mktemp /tmp/dtodo-script.XXXXXX)
		grep -ve '^[[:space:]]*$' "$notes_path/$notes_file" > "$tempfile"
		cp "$tempfile" "$notes_path/$notes_file"

		sort -u "$notes_path/$notes_file" > "$tempfile"
		mv "$tempfile" "$notes_path/$notes_file"
		#notify-send -u low "$notes_file cleaned."

	elif [ "$op" == "---Delete File---" ]
        then
		#Delete the current file and wait for user to choose another to open or quit
		#If no file is selected, we go back to the default
		if [ "$(printf "No\\nYes" | dmenu -i -p "Really delete $file?")" == "Yes" ]
		then
			rm "$notes_path/$notes_file"
			#notify-send -u low "$notes_file deleted."
			notes_file=TODO.txt
			switch_file
		
		fi

	elif grep -Fxq "$op" "$notes_path/$notes_file"
	then
		#Remove selected string from file (and it's duplicates)
		tempfile=$(mktemp /tmp/dtodo-script.XXXXXX)
		grep -Fvx "$op" "$notes_path/$notes_file" > "$tempfile"
		mv "$tempfile" "$notes_path/$notes_file"

	elif [ "$op" ]
	then
		#Append new string to file
		#Doing the same test as the while loop because we don't want to insert empty lines
		printf "%s\n" "$op" >> "$notes_path/$notes_file"

	fi
done

