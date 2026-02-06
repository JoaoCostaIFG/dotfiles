# ALIAS

# source the common aliases between other shells (e.g. bash)
source "$HOME/.config/aliasrc"

# typo friendly
abbr -a -- :q " exit"
abbr -a -- :Q " exit"

# cd
abbr -a -- cd.. cd ..
abbr -a -- cd... cd ../..
abbr -a -- dc prevd
abbr -a -- cdd nextd
# go back any number of dirs: .., ..., ...., etc...
abbr --add dotdot --regex '^\.\.+$' --function multicd

# shortcuts for commands
abbr -a -- ka killall
abbr -a -- e $EDITOR
abbr -a -- f $FILE
abbr -a -- E sudo -E $EDITOR
abbr -a -- Nvim sudo -E nvim
abbr -a -- v $EDITOR
abbr -a -- p sudo pacman
abbr -a -- s sudo systemctl
abbr -a -- ssu systemctl --user
abbr -a -- bye " systemctl poweroff"
abbr -a -- byer " systemctl reboot"
abbr -a -- battery acpi -b
abbr -a -- dmenu bemenu
abbr -a -- neofetch fastfetch
abbr -a -- maxima mmaxima
abbr -a -- authgovt eidguiV2
abbr -a -- raposoflamejante firefox
abbr -a -- passarinhorelampjante thunderbird
abbr -a -- yay paru

# safety measures
abbr -a -- cp cp -i
abbr -a -- ln ln -i
abbr -a -- mv mv -i
abbr -a -- rm rm -I
abbr -a -- chown chown --preserve-root
abbr -a -- chmod chmod --preserve-root
abbr -a -- chgrp chgrp --preserve-root

# new commands
abbr -a -- lll ll -a
abbr -a -- dsize du -sh
abbr -a -- openports ss --all --numeric --processes --ipv4 --ipv6
abbr -a -- pp "ps -Af | fzf"
alias decompress="ouch decompress"
alias cop="gh copilot suggest -t shell"
alias copg="gh copilot suggest -t git"
alias cope="gh copilot explain"
alias hist="history | fzf | wl-copy"
alias yt="yt-dlp --cookies-from-browser firefox --remote-components ejs:github --add-metadata -ic -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(title)s.%(ext)s'"
alias yta="yt -x -f bestaudio/best --audio-format mp3"
alias listen="ffplay -nodisp -f alsa -i default"

# printer/scanner #
abbr -a -- find_scanners "scanimage -L"
abbr -a -- scan_pdf 'scanimage --format=pdf --output-file out-$(date +%s).pdf --progress --resolution 300 -d "pixma:MG3600_439892000000"'
abbr -a -- scan_pdf_highest_quality 'scanimage --format=pdf --output-file out-$(date +%s).pdf --progress --resolution 1200 -d "pixma:MG3600_439892000000"'
