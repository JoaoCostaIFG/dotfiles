# ALIAS #
# typo friendly #
alias   :q=" exit"
alias   :Q=" exit"
alias   :x=" exit"
alias   dc="prevd"
alias   cdd="nextd"
alias   cd..="cd .."
alias   ...="cd ../.."
alias   cd...="cd ../.."
alias   lhome="ls -lAh --group-directories-first --color=auto $HOME"
alias   ls="ls --group-directories-first --color=auto"
alias   ll="ls -lh --group-directories-first --color=auto"
alias   lll="ls -lAh --group-directories-first --color=auto"
alias   llll="ls -lAh --group-directories-first --color=auto"

# changed commands #
alias   bye="shutdown now"
alias   sbye="sleep 10; shutdown now"
alias   byer="shutdown -r now"
alias   dir="dir --color=auto"
alias   vdir="vdir --color=auto"
alias   diff="diff --color=auto"
alias   du="du -ch"
alias   df="df -h"
alias   ffmpeg="ffmpeg -hide_banner"
alias   mkdir="mkdir -p -v"
alias   dmesg="dmesg -HL"
alias   grep="grep --color=auto"
alias   egrep="egrep --color=auto"
alias   fgrep="fgrep --color=auto"

# safety measures #
alias   cp="cp -i"
alias   ln="ln -i"
alias   mv="mv -i"
alias   rm="rm -I"
alias   chown="chown --preserve-root"
alias   chmod="chmod --preserve-root"
alias   chgrp="chgrp --preserve-root"

# new commands #
alias   bat="acpi -b"
alias   dperm="chmod 750"
alias   fperm="chmod 640"
alias   dsize="du -sh"
alias   hist="history | fzf"
alias   ka="killall"  # requires an argument
alias   openports="ss --all --numeric --processes --ipv4 --ipv6"
alias   pp="ps -Af | grep"  # requires an argument
alias   yt="youtube-dl --add-metadata -ic"
alias   yta="yt -x -f bestaudio/best"
alias   clndep='sudo pacman -R (pacman -Qdtq)'
alias   clnrep="printf 'Cleaning uninstalled packages\n'; sudo paccache -ruk0; printf 'Leaving last version of installed packages\n'; sudo paccache -rk1"

# abbreviations #
alias   f="$FILE"
alias   e="$EDITOR"
alias   E="sudo -E $EDITOR"
alias   v="$EDITOR"
alias   p="sudo pacman"

# programs #
alias   crono="time read stop"
alias   yay="yay --aur" # prevent partial upgrades
alias   raposoflamejante="firefox &"
alias   passarinhorelampjante="thunderbird &"
alias   calcurse="calcurse -D $HOME/Documents/calcurse -C $HOME/.config/calcurse"
alias   maxima="mmaxima"
alias   ssync="rsnapshot full"
alias   git="g" # usa my wrapper script, g, for git
# use neovim for vim and nano if present
command -v nvim >/dev/null && alias vim="nvim" && alias vimdiff="nvim -d" && alias nano="nvim"
