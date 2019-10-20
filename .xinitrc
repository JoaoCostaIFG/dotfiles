# KEYBOARD LAYOUT AND CUSTOM KEYS #
xrdb "$HOME/.Xresources"
setxkbmap -layout pt
xmodmap "$HOME/.Xmodmap"

# DWM INFO #
#dwm_statusmonitor &
slslstatus &

# LOCKING TIME #
xsidle slock &

# COMPOSITE MANAGER #
compton -b

# SET WALLPAPER #
nitrogen --restore &

# NOTIFICATION DAEMON #
dunst &

# MUSIC PLAYER STUFF #
#mpd >/dev/null 2>&1 &
[ ! -s ~/.config/mpd/pid ] && mpd &

# DWM STARTING LOOP #
while true
do
        # Log stderror to a file
        #dwm 2> ~/.dwm.log
        # No Logging
        dwm >/dev/null 2>&1
done

