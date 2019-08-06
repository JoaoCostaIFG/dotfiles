#KEYBOARD LAYOUT AND CUSTOM KEYS
xrdb $HOME/.Xresources
setxkbmap -layout pt
xmodmap $HOME/.Xmodmap

#DWM INFO
dwm_statusmonitor &

#Screen locking timer
xsidle slock &

#Start compositing window manager
compton -b

#Restore wallpaper
nitrogen --restore &

#Start notification daemon (d-bus)
dunst &

#Start music player shit
#mpd >/dev/null 2>&1 &
[ ! -s ~/.config/mpd/pid ] && mpd &

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

