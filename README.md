# Dotfiles

My current dotfiles and scripts. I manage these using
[DotBot](https://github.com/anishathalye/dotbot).

The scripts were written by me for me. Feel free to adapt them to your needs.

## Contents

- The **scripts** directory contents should be kept somewhere in the user's
  **PATH**;
- The dotfiles in the [homedir directory](./homedir) should be kept in the
  user's home directory;
- The dotfiles in the [dot_config directory ](./dot_config) should be kept in
  the user's `.config` directory.

**Note:** the dot (`.`) at the start of the dotfiles was replaced by `dot_`;

## Scripts

Go to the [scripts directory](./scripts) to find out more about all the scripts
(the [README.md file](./scripts/README.md) of that directory). These
descriptions are generated semi-automatically using the descriptions in the
comments at the beginning of each file. Some files maybe have the descriptions
missing, because I forgot to comment them.

### License

The scripts are licensed under an [MIT License](./LICENSE)

## Wallpaper

I include in this repo the [wallpapers](./dot_config/wallpaper) I use. Sources:

- [Anorlondo](./dot_config/wallpaper/anorlondo) - [BestAlero](https://www.reddit.com/r/gaming/comments/4jdw0t/pixel_dark_souls_3_irithyll_of_the_boreal_valley/);
- [Firelink](./dot_config/wallpaper/firelink) -
  [Zedotagger](https://www.deviantart.com/zedotagger);
- [Forest](./dot_config/wallpaper/tree.png) - don't know.

## Notes on fish

I'm currently using [Fish](https://fishshell.com/) as my "main" shell. Fish
isn't POSIX compliant, which poses a problem: how to keep my Bash and Fish
configs in sync. [Babelfish](https://github.com/bouk/babelfish) to the rescue
(no, not the [translation application](https://www.babelfish.com)). I'm using
babelfish to translate my existing POSIX compliant files
([environment vars](./homedir/dot_profile), [aliases](./dot_config/aliasrc), and
[functions](./dot_config/funcrc)) to Fish and sourcing them.

## Other "dotfile-ish" stuff

- Terminal - [st](https://github.com/JoaoCostaIFG/st)
- Window Manager - [dwm](https://github.com/JoaoCostaIFG/dwm)
- Application launcher - [dmenu](https://github.com/JoaoCostaIFG/dmenu)
- Status bar - [dwmblocks](https://github.com/JoaoCostaIFG/dwmblocks)
- Terminal font - [VictorCodePro](https://github.com/JoaoCostaIFG/VictorCodePro)
