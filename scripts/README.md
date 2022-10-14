# Scripts

## chtermname

Show current directory in window title.
This is not standard so might not work on someplaces.

## colors

Displays space invaders in the different terminal colors.
ANSI color scheme script featuring PACMAN
Author: pfh
Source: http://crunchbang.org/forums/viewtopic.php?pid=144481#p144481 
Initializing procedure by lolilolicon

## decompress

A general, all-purpose extraction script.

Default behavior: Extract archive into new directory
Behavior with `-c` option: Extract contents into current directory

## dimmer

Dims all screens by lowering their brightness. Restores the brightness on exit/kill.
Based on [xss-lock's dim-screen.sh](https://github.com/xdbob/xss-lock/blob/master/doc/dim-screen.sh).

The ddcci kernel module (aur: ddcci-driver-linux-dkms) allows this script to work
with external monitors.  
Depends on brightnessctl.

## dmenu/dlinkhandler

Feed this script a link and it will give dmenu some choice programs to use
to open it.
Based on Luke Smith's dmenuhandler script

## dmenu/dmount

Helpful to help mount external devices/android devices.
Requires dmenu, simple-mtpfs, and optionally udisks2.
Prefers using udisks2 but falls back to mount/umount.
Might not work for all kinds of Android phones (check:
[Arch wiki android](https://wiki.archlinux.org/index.php/Android#Transferring_files)).

## dmenu/dpass

Read input from the user without showing it.
Simple script to get the sudo password from a user using **dmenu** (hides the typed characters).

## dmenu/dpizhid

My password helper script

## dmenu/drecord

Use dmenu to record stuff (screen, audio, camera, etc..)
If there is already a running instance, user will be prompted to end it.

## dmenu/dtodo

dmenu TODO list and file editor
Tool I use to take quick notes and keep track of information. It
can handle multiple files, organize lines alphabetically, and get
rid of blank/empty lines. Depends on suckless's.

## dmenu/mdmenu_run

This dmenu wrapper is a replacement for the default **dmenu_run**:
- Uses a cache file and sorts it by number of usages (has max entries
for cache file);
- Runs command in a new terminal window if `;` is appended to the command;
- Has option to list and browse files (cd's to them using file manager);
- Also lists directories up to a certain depth and cd's to them
if selected.
Depends on suckless's [dmenu](https://tools.suckless.org/dmenu/).

## dunst_toggle

Toggles dunst's notifications.

## g

JoaoCostaIFG's git wrapper because he was lazy and tired of creating aliases.
DWTFYW LICENSE

## imagemagick_prtsc

Old script I used to use to take fullscreen screenshots and as a snipping tool.
Too slow for my liking so I switched to [maim](https://github.com/naelstrof/maim)
via the **maim_handler** script.
Pass any/amount of argument(s) to make a snipping tool instead.
Requires imagemagick.

## lfcd_sh

Wrapper for [lf](https://github.com/gokcehan/lf) to **cd** to
the last visited directory on exit. Usefull for keybinds. Slight adaptation
from the suggestion given on [lf's](https://github.com/gokcehan/lf) wiki.
Open lf on current directory and cd to the last shown dir on exit

## linkhandler

Feed script a url or file location.
If image or gif, view in sxiv,
if video, watch in mpv
if music file or pdf, download,
otherwise it opens link in browser.
Based on https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/linkhandler

## maim_handler

Script that can: take full-screen screen-shots (saves them
in a previously specified folder), screen-shot a selection of the screen
(places the image in the clipboard), output color information of a selection
(saves RGB color code in clipboard and show a notification for it too).
Args:
- "snip" - take a snip and pass it to the clipboard
- "picker" - color picker (needs work)
- "current" - snip current active window
- "screenshot" - take a fullscreen screenshot and save it in a file
- no args - dmenu arg selection
Requires [maim](https://github.com/naelstrof/maim) and xclip.

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

## next_sink

switch to the next sink on pulseaudio

## noita_backup

manage my noita backups

## pdfsmallifier

Attempts to make PDF file smaller. Doesn't work everytime.
Depends on: ghostscript (compress PDF).
For input file "input.pdf", the output is "input.sml.pdf"
Usage: pdfsmallifier [--bw] <input.pdf>

## screen_measure

Measure screen area. Basically a wrapper for hacksaw with notifications.  
Depends on hacksaw (but could use something like slop as well).

## screenshots

Script that can:
- Take full-screen screen-shots (saves them in a previously specified folder);
- Screen-shot a selection of the screen (places the image in the clipboard);
- Output color information of a selection (saves RGB color code in clipboard and show a notification for it too).

Args:
- "snip" - take a snip and pass it to the clipboard (just clicking get the full clicked window);
- "picker" - color picker (needs work);
- "current" - snip current active window;
- "screenshot" - take a fullscreen screenshot and save it in a file;
- no args - dmenu arg selection.
Depends on [shotgun](https://github.com/neXromancers/shotgun), hacksaw,
[colorpicker](https://github.com/Jack12816/colorpicker), xdotool, xclip, and dmenu.

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

## st-float

Spawns an instance of the st terminal with a fixed geometry and name:

- Class: $TERM
- Instance: st-float
- Position: 180x40
- X-offset: 300
- Y-offset: 16

Depends on: xdotool, and xwininfo.

## sxiv_folder

Wrapper for [sxiv](https://github.com/muennich/sxiv) that opens all
imagefiles inside a directory. If a file is provide, all the other
files inside it's folder are also opened with sxiv
Requires find, xargs and sxiv.

## systray

This spawns stalonetray (-s option) as a system-tray and hides it. When the script
when the script is called again the system-tray is shown under the mouse, and hidden
when the mouse leaves.  
Yes, this is weird, but I like it.

Depends on: stalonetray, and xdotool.

## truecolortest

If you see a continuous color spectrum, you have truecolor support

