#!/bin/sh

op=$(printf "Mount drive\nUmount drive\nMount android\nUmount android\n" | dmenu -i -p "What to do:")

if [ "$op" ]
then
	if [ "$op" = "Mount drive" ]
	then
		selected_drive=$(lsblk -nr | 
			awk '$6!="disk" && $7=="" {print $1 " " $4}' | 
			dmenu -i -p "Drive to mount:" | 
			sed -e 's/\s.*$//')
		existance=$(lsblk -nr | 
			awk '$6!="disk" && $7=="" {print $1 " " $4}' | 
			sed -e 's/\s.*$//' | 
			awk -v cmp_var="$selected_drive" '$0 == cmp_var')
		
		if [ "$existance" ]
		then
			sudo mkdir /mnt/$selected_drive
			sudo mount /dev/$selected_drive /mnt/$selected_drive
			notify-send "DMOUNT" "$selected_drive partition mounted to /mnt/$selected_drive" &
		fi
	elif [ "$op" == "Umount drive" ]
	then
		selected_drive=$(lsblk -nr | 
			awk '$6!="disk" && $7!="" {print $1 " " $4}' | 
			dmenu -i -p "Drive to umount:" | 
			sed -e 's/\s.*$//')
		existance=$(lsblk -nr | 
			awk '$6!="disk" && $7!="" {print $1 " " $4}' | 
			sed -e 's/\s.*$//' | 
			awk -v cmp_var="$selected_drive" '$0 == cmp_var')
		
		if [ "$existance" ]
		then
                	sudo umount /dev/$selected_drive
			sudo rmdir /mnt/$selected_drive
			notify-send "DMOUNT" "$selected_drive partition umounted from /mnt/$selected_drive" &
		fi
	elif [ "$op" == "Mount android" ]
	then
		selected_drive=$(simple-mtpfs -l | 
			dmenu -i -p "Drive to umount:" | 
			sed s/:/\/ | 
			sed -e 's/\s.*$//')
		existance=$(simple-mtpfs -l | 
			sed s/:/\/ | 
			sed -e 's/\s.*$//' | 
                        awk -v cmp_var="$selected_drive" '$0 == cmp_var')

		if [ "$existance" ]
		then
			mkdir $HOME/Android$selected_drive
			simple-mtpfs --device $selected_drive $HOME/Android$selected_drive
			notify-send "DMOUNT" "Android partition $selected_drive mounted to ~/Android$selected_drive" &
		fi

	elif [ "$op" == "Umount android" ]
	then
		selected_drive=$(simple-mtpfs -l | 
			dmenu -i -p "Drive to umount:" | 
			sed s/:/\/ | 
			sed -e 's/\s.*$//')
		existance=$(simple-mtpfs -l | 
			sed s/:/\/ | 
			sed -e 's/\s.*$//' | 
			awk -v cmp_var="$selected_drive" '$0 == cmp_var')

		if [ "$existance" ]
		then
			fusermount -u $HOME/Android$selected_drive
			rmdir $HOME/Android$selected_drive
			notify-send "DMOUNT" "Android partition $selected_drive umounted from ~/Android$selected_drive" &
		fi
	
	fi
fi

