xrbd -merge $HOME/.Xresources
setxkbmap -layout pt
xmodmap $HOME/.Xmodmap

#DWM INFO
$HOME/Scripts/dwm_statusmonitor.sh &

compton -b #Start compositing window manager

nitrogen --restore & #Restore wallpaper

dunst & #Start notification daemon (d-bus)

#Autostart
	keepassxc &


#DWM Starter
while true
do
        # Log stderror to a file
        #dwm 2> ~/.dwm.log
        # No Logging
        dwm >/dev/null 2>&1
done
