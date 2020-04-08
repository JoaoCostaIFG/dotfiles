# KEYBOARD LAYOUT AND CUSTOM KEYS #
[ -f "$HOME/.config/.Xresources" ] && xrdb "$HOME/.config/.Xresources"
setxkbmap -layout pt
[ -f "$HOME/.config/.Xmodmap" ] && xmodmap "$HOME/.config/.Xmodmap"

# DWM INFO #
slslstatus &

# LOCKING TIME #
xsidle slock &

# COMPOSITE MANAGER #
picom --experimental-backends -b

# SET WALLPAPER #
xwallpaper --zoom "$HOME/.config/wallpaper.png" &

# NOTIFICATION DAEMON #
dunst &

# MUSIC PLAYER STUFF #
#mpd >/dev/null 2>&1 &
[ ! -s ~/.config/mpd/pid ] && mpd &

# JVM fx #
wmname "LG3D"

# DWM STARTING LOOP #
while true
do
  # dwm 2> ~/.dwm.log # log stderror to a file
  dwm >/dev/null 2>&1 # No Logging
done
