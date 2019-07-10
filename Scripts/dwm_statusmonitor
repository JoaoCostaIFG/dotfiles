#!/bin/sh

while true
do
        VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')	#VOL as %
        LOCALTIME=$(date +%d-%m-%Y\ %H:%M)					#Time as dd-mm-yyyy hh:mm
        TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"	#Temp as tC (t is int degrees)

	xsetroot -name "$TEMP $VOL $LOCALTIME"					#Show the info

	sleep 3s								#Wait 3s before starting the next update
done
