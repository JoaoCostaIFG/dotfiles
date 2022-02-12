# Dotfiles

My current dotfiles and scripts. Scripts were written by me as mostly learning
exercises but also to improve my system usability.

## Notes

- The dot (`.`) at the start of the dotfiles was replaced by `dot_`;
- The **scripts** directory contents should be kept somewhere in the user's
  **PATH**;
- The dotfiles in the [homedir directory](./homedir) should be kept in the
  user's home directory;
- The dotfiles in the [dot_config directory ](./dot_config) should be kept in
  the user's `.config` directory.

## Scripts

- **colors** - displays space invaders in the different terminal colors (I think
  it was taken from the arch wiki but I can't find it anymore).

- **cp_homeconf** - I use this to copy the pre-programmed list of
  files/directories to and from my dotfile repository (makes the commits
  faster).

- **decompress** - decompress/inflates archives using the right command for the
  job.

- **dmount** - helpful tool to mount external devices/Android phones. Might not
  work for all kinds of Android phones (check:
  [Arch wiki android](https://wiki.archlinux.org/index.php/Android#Transferring_files)).
  Depends on suckless's [dmenu](https://tools.suckless.org/dmenu/).

- **dpass** - simple script to get the sudo password from a user using **dmenu**
  (hides the typed characters). Depends on suckless's
  [dmenu](https://tools.suckless.org/dmenu/).

- **dtodo** - tool I use to take quick notes and keep track of information. It
  can handle multiple files, organize lines alphabetically, get rid of
  blank/empty lines. Depends on suckless's
  [dmenu](https://tools.suckless.org/dmenu/).

- **dwm_statusmonitor** - old script I used to use to update suckless's
  [dwm](https://dwm.suckless.org/) top bar information.

- **dwm_statusmonitor_single** - old script I used to use to update suckless's
  only once (not looping) [dwm](https://dwm.suckless.org/) top bar information.

- **imagemagick_prtsc** - old script I used to use to take fullscreen
  screenshots and as a snipping tool. Too slow for my liking so I switched to
  [maim](https://github.com/naelstrof/maim) via the **maim_handler** script.

- **lfcd_sh** - wrapper for [lf](https://github.com/gokcehan/lf) to **cd** to
  the last visited directory on exit. Usefull for keybinds. Slight adaptation
  from the suggestion given on [lf's](https://github.com/gokcehan/lf) github
  wiki.

- **maim_handler** - script that can: take full-screen screen-shots (saves them
  in a previously specified folder), screen-shot a selection of the screen
  (places the image in the clipboard), output color information of a selection
  (saves RGB color code in clipboard and show a notification for it too).
  Depends on [maim](https://github.com/naelstrof/maim).

- **mdmenu_run** - This dmenu wrapper is a replacement for the default
  **dmenu_run**: uses a cache file and sorts it by number of usages (has max
  entries for cache file); runs command in a new terminal window if **';'** is
  appended to a command; has option to list and browse files (cd's to them using
  file manager); also lists directories up to a certain depth and cd's to them
  if selected. Depends on suckless's [dmenu](https://tools.suckless.org/dmenu/).

- **mepapemaker** - script to add a transparent and blured Arch Linux logo to
  the center of an image. Source is listed in the script's code.

- **mmaxima** - script that calls maxima on a terminal. It uses **rlwrap** for
  history and built-ins file (and getline). It is based on **rmaxima** but it
  has a few improvements. Depends on [maxima](http://maxima.sourceforge.net/).

- **skane** - a Snake clone I made (and have been slightly modifing/improving
  over time) as a final project for a linux terminal workflow/bash scripting
  school class. It has a lot of "bashisms" so it needs to be run on bash.
  Sometimes I just call it on a terminal to kill time.

- **sxiv_folder** - wrapper for [sxiv](https://github.com/muennich/sxiv) that
  opens all images on a folder even if only 1 image from that folder has been
  used as an argument for the command.

- **xsidle** - really simple script from suckless that waits until the user has
  been inactive for some time to run a command. I use it to run suckless's
  screenlock utility, [slock](https://tools.suckless.org/slock/). Source:
  [xssstate](https://tools.suckless.org/x/xssstate/).
