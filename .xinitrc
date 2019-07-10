#KEYBOARD LAYOUT AND CUSTOM KEYS
xrbd -merge $HOME/.Xresources
setxkbmap -layout pt
xmodmap $HOME/.Xmodmap

#DWM INFO
$HOME/Scripts/dwm_statusmonitor &

#Screen locking timer
$HOME/Scripts/xsidle slock &

#Start compositing window manager
compton -b

#Restore wallpaper
nitrogen --restore &

#Start notification daemon (d-bus)
dunst &

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

