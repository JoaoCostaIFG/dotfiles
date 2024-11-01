# Scripts

## blueidle

This script inhibits system idling when a bluetooth device, from a list of
devices, is connected to the computer. Useful to unlock the computer when
your close to it.

Keep a config file in `~/.config/blueidle.toml` with contents following
something like this:

```bash
[general]
lock_cmd = "loginctl lock-session"
unlock_cmd = "ydotool mousemove -- 1 0; pkill -USR1 hyprlock"
query_interval_secs = 5
lock_at_startup = 1
devices = ["XX:XX:XX:XX:XX:XX", "YY:YY:YY:YY:YY:YY"]
```

This script depends on tombl to parse/read the config file.

## chtermname

Show current directory in window title.
This is not standard so might not work on someplaces.

## codi

Simple script to open a [codi](https://github.com/metakirby5/codi.vim)
notebook in Neovim.

## colors

Displays space invaders in the different terminal colors.
ANSI color scheme script featuring PACMAN
Author: pfh
Source: http://crunchbang.org/forums/viewtopic.php?pid=144481#p144481 
Initializing procedure by lolilolicon

## dmenu/dmount

Helpful to help mount external devices/android devices.
Requires bemenu, simple-mtpfs, and optionally udisks2.
Prefers using udisks2 but falls back to mount/umount.
Might not work for all kinds of Android phones (check:
[Arch wiki android](https://wiki.archlinux.org/index.php/Android#Transferring_files)).

## dmenu/drecord

Use bemenu to record stuff (screen, audio, camera, etc..)
If there is already a running instance, user will be prompted to end it.

## dmenu/dtodo

bemenu TODO list and file editor
Tool I use to take quick notes and keep track of information. It
can handle multiple files, organize lines alphabetically, and get
rid of blank/empty lines. Depends on suckless's.

## dmenu/mdmenu_run

This bemenu wrapper is a replacement for the default **dmenu_run**:
- Uses a cache file and sorts it by number of usages (has max entries
for cache file);
- Runs command in a new terminal window if `;` is appended to the command;
- Has option to list and browse files (cd's to them using file manager);
- Also lists directories up to a certain depth and cd's to them
if selected.
Depends on [bemenu](https://github.com/Cloudef/bemenu).

## dunst_toggle

Toggles dunst's notifications.

## g

My git wrapper. Calls `git status` when no argument is given.

## import-gsettings

Imports settings from gtk-3.0/settings.ini to gsettings
Used for wayland
See [sway wiki page about GTK 3](https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland)

## lfcd_sh

Wrapper for [lf](https://github.com/gokcehan/lf) to **cd** to
the last visited directory on exit. Usefull for keybinds. Slight adaptation
from the suggestion given on [lf's](https://github.com/gokcehan/lf) wiki.
Open lf on current directory and cd to the last shown dir on exit

## md2pdf

Compile a markdown file to pdf.
Depends on: pandoc (markdown to PDF), pdfsmallifier script (compress PDF)
Usage: md2pdf [--bw] <mdfile1>
https://leancrew.com/all-this/2022/01/reducing-the-size-of-large-pdfs

## mmaxima

Script that calls maxima on a terminal. It uses **rlwrap** for
history and built-ins file (also for getline). It is based on **rmaxima**
but it has a few improvements.
Depends on [maxima](http://maxima.sourceforge.net/).

## next_sink.sh

switch the default sink (audio output) to next one available
Selects by ID and wrap-around

## noita_backup

manage my noita backups

## pdfsmallifier

Attempts to make PDF file smaller. Doesn't work everytime.
Depends on: ghostscript (compress PDF).
For input file "input.pdf", the output is "input.sml.pdf"
Usage: pdfsmallifier [--bw] <input.pdf>

## screen_brightness_ctl.sh

Sets the brightness of external monitors.
Just pass the number and it sets the same value on all detected monitors.
The previous brightness value for each monitor is stored on a cache file and
can be restored by the `restore` command. The `lower` command sets all monitors
to a pre-defined low value (default 10).

## screen_measure

Measure screen area. Basically a wrapper for slurp with notifications.  
Depends on slurp (but could use something like hacksaw if I was on X11).

## screenshots

Script that can:
- Take full-screen screen-shots (saves them in a previously specified folder);
- Screen-shot a selection of the screen (places the image in the clipboard);
- Output color information of a selection (saves RGB color code in clipboard and show a notification for it too).

Args:
- "snip" - take a snip and pass it to the clipboard (just clicking get the full clicked window);
- "snip-edit" - take a snip and edit it
- "picker" - color picker (needs work);
- "current" - screenshot current screen;
- "current-save" - screenshot current screen and auto save it to $SCREENSHOT_SAVEDIR directory;
- no args - dmenu arg selection.
Depends on:
- [grim](https://sr.ht/~emersion/grim/)
- [slurp](https://github.com/emersion/slurp)
- [swappy](https://github.com/jtheoof/swappy)
- [hyprpicker](https://github.com/hyprwm/hyprpicker)
- wl-clipboard
- bemenu

## shortcuts

add alias (shortcuts) for configured dirs
based on https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/shortcuts

## skane

A Snake clone I made (and have been slightly modifing/improving over time)
as a final project for a linux terminal workflow/bash scripting
school class. It has a lot of "bashisms" so it needs to be run on bash.
Sometimes I just call it on a terminal to kill time.
Instructions
- `W, A, S, D` for movement;
- `P` for pause.
- `Esc/Q` for quit.
- Eat the @ signs (apples)
- Don't eat the # (walls) or yourself.

## truecolortest

If you see a continuous color spectrum, you have truecolor support

## update-zfs

Simple script that checks if it's safe to update the Kernel to current
version on Arch's repos given the officially supported Kernel versions
reported by OpenZFS.

