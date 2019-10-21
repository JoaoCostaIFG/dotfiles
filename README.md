# dotfiles

My current dotfiles and scripts. Scripts were written by me as mostly learning exercises but also to improve my system usability.  
Scripts:
- **colors** - displays space invaders in the different terminal colors (I think it was taken from arch wiki but I can't find it right now).  
- **decompress** - decompress/inflates archives using the right command for the job.  
- **dmount** - helpful tool to mount external devices/Android phone. Might not work for all kinds of Android phones. Depends on suckless's [dmenu](https://tools.suckless.org/dmenu/).  
- **dtodo** - tool I use to take quick notes. Can handle multiple files, organize lines alphabetically, get rid of blank/empty lines, [dmenu](https://tools.suckless.org/dmenu/).  
- **dwm_statusmonitor** - script I used to use to update suckless's [dwm](https://dwm.suckless.org/) top bar information.  
- **imagemagick_prtsc** - old script I used to use to take screenshots and as a snipping tool. Too slow for my liking so I switched to using [maim](https://github.com/naelstrof/maim) via the **maim_handler** script.  
- **lfcd_sh** - wrapper around [lf](https://github.com/gokcehan/lf) to make a terminal opened with this script, as the command to run, cd to the last working folder on [lf](https://github.com/gokcehan/lf) on exit. Usefull for keybinds. Slight adaptation from the suggestion given on [lf's](https://github.com/gokcehan/lf) github wiki.  
- **maim_handler** - script I use to take fullscreen screenshots and save them automatically in a specific folder, use as a snipping tool (saves snipps in clipboard) and as a color picker (save RGB color code in clipboard and shows a notification for it too). Depends on [maim](https://github.com/naelstrof/maim).  
- **skane** - a snake clone I made (and have been slightly modifing/improving over time) as a final project for a linux terminal workflow/bash scripting school class. It has a lot of "bashisms" so it needs to be run on bash. Sometimes I just call it on a terminal to kill sometime.  
- **sxiv_folder** - wrapper for [sxiv](https://github.com/muennich/sxiv) that opens all images on a folder even if only 1 image from that folder has been used as an argument for the command.  
- **xsidle** - really simple script from suckless that waits until the user has been inactive for some time to run a command. I use it to run suckless's screenlock utility, [slock](https://tools.suckless.org/slock/). Source: [xssstate](https://tools.suckless.org/x/xssstate/).  
