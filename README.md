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

**Note:** I replaced the dot, `.`, in the file paths by `dot_`.

## Scripts

Go to the [scripts directory](./scripts) to find out more about all the scripts
(the [README.md file](./scripts/README.md) of that directory).

That [README.md file](./scripts/README.md) is generated automatically using the
descriptions in the header blocks of each script file. Some files maybe have
the descriptions missing, because I forgot to comment them.

### License

The scripts are licensed under an [MIT License](./LICENSE)

## Wallpaper

I include in this repo the [wallpapers](./dot_config/wallpaper) I use. Sources:

- [Anorlondo](./dot_config/wallpaper/anorlondo) - [BestAlero](https://www.reddit.com/r/gaming/comments/4jdw0t/pixel_dark_souls_3_irithyll_of_the_boreal_valley/);
- [Firelink](./dot_config/wallpaper/firelink) -
  [Zedotagger](https://www.deviantart.com/zedotagger);
- [Forest](./dot_config/wallpaper/tree.png) - don't know.

**Note**: I've modified them slightly to better fit my tastes.OA

## Notes on fish

I'm currently using [Fish](https://fishshell.com/) as my "main" shell. Fish
isn't POSIX compliant, which poses a problem: how to keep my Bash and Fish
configs in sync. [Babelfish](https://github.com/bouk/babelfish) to the rescue
(no, not the [translation application](https://www.babelfish.com)). I'm using
babelfish to translate my existing POSIX compliant files
([environment vars](./homedir/dot_profile), [aliases](./dot_config/aliasrc), and
[functions](./dot_config/funcrc)) to Fish and sourcing them.

This allows me to keep a consistent environment between my sheels. I don't store
that translated files, which means they are always translated again.

## Other "dotfile-ish" stuff

- Terminal - [alacritty](https://alacritty.org)
- Wayland compositor - [Hyprland](https://hyprland.org)
- Application launcher and menus - [bemenu](https://github.com/Cloudef/bemenu)
- Status bar - [Waybar](https://github.com/Alexays/Waybar)
- Fonts:
  - [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)
  - [Sauce Code Pro from nerd fonts](https://github.com/ryanoasis/nerd-fonts)
  - [VictorCodePro](https://github.com/JoaoCostaIFG/VictorCodePro)

