#!/bin/sh

# XRESOURCES #
sysresources=/etc/X11/xinit/.Xresources
[ -f "$sysresources" ] && xrdb -merge "$sysresources"
userresources="$HOME/.config/.Xresources"
[ -f "$userresources" ] && xrdb -merge "$userresources"

# KEYBOARD STUFF #
xset r rate 300 50
setxkbmap -layout pt
setxkbmap -option caps:escape
sysmodmap=/etc/X11/xinit/.Xmodmap
[ -f "$sysmodmap" ] && xmodmap "$sysmodmap"
usermodmap="$HOME/.config/.Xmodmap"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

# SOURCE X11/xinit/xinitrc.d SCRIPTS #
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# MY PROGS #
# DWM status bar (kill it on script end)
dwmblocks -b
trap 'dwmblocks -k; exit 0' INT
# lock screen
xsidle slock &
# composite manager
picom --experimental-backends -b
# wallpaper
xwallpaper --zoom "$HOME/.config/wallpaper.png" &
# notification daemon
dunst &
# start music player daemon (if it isn't started yet)
[ ! -s ~/.config/mpd/pid ] && mpd >/dev/null 2>&1 &
wmname "LG3D" # JVM fix (https://tools.suckless.org/x/wmname)

# DWM STARTING LOOP #
while true; do
  # dwm 2> ~/.dwm.log # log stderror to a file
  dwm >/dev/null 2>&1 # No Logging
done
