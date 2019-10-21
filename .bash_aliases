# ALIAS #
	# typo friendly #
	alias    :q=' exit'
	alias    :Q=' exit'
	alias    :x=' exit'
  	alias    cd..='cd ..'
  	alias    cd...='cd ..'
	alias    cd....='cd ../..'
	alias    lhome='ls -lAh --group-directories-first --color=auto $HOME'
	alias    ls='ls --group-directories-first --color=auto'
  	alias    ll='ls -lh --group-directories-first --color=auto'
  	alias    lll='ls -lAh --group-directories-first --color=auto'
  	alias    llll='ls -lAh --group-directories-first --color=auto'

	# changed commands #
  	alias    bye='shutdown now'
	alias    byer='shutdown -r now'
	alias    dir='dir --color=auto'
	alias    vdir='vdir --color=auto'
	alias    diff='diff --color=auto'
	alias    du='du -ch'
	alias    df='df -h'
	alias    mkdir='mkdir -p -v'
	alias    dmesg='dmesg -HL'
	alias    grep='grep --color=auto'
	alias    egrep='egrep --color=auto'
	alias    fgrep='fgrep --color=auto'
  	alias    yay='yay --aur'    # prevent partial upgrades

	# new commands #
	alias    dperm='chmod 750'
	alias    fperm='chmod 640'
	alias    dsize='du -sh'
	alias    hist='history | grep'  # requires an argument
  	alias    ka='killall'  # requires an argument
	alias    openports='ss --all --numeric --processes --ipv4 --ipv6'
	alias    pp='ps -Af | grep'  # requires an argument
	alias    yt='youtube-dl --add-metadata -ic'
	alias    yta='youtube-dl --add-metadata -xic'
	alias    clndep='sudo pacman -R $(pacman -Qdtq)'
  	alias    clnrep='printf "Cleaning uninstalled packages\n"; sudo paccache -ruk0; printf "Leaving last version of installed packages\n"; sudo paccache -rk1'

	# safety measures #
	alias    cp='cp -i'
	alias    ln='ln -i'
	alias    mv='mv -i'
	alias    rm='rm -I'
	alias    chown='chown --preserve-root'
	alias    chmod='chmod --preserve-root'
	alias    chgrp='chgrp --preserve-root'

	# programs #
	alias    raposoflamejante='firefox &'
	alias    passarinhorelampjante='thunderbird &'
	alias    calcurse='calcurse -D $HOME/Documents/calcurse -C $HOME/.config/calcurse'
	alias	 maxima='rlwrap -c -H $HOME/.config/maxima/maxima-history -f $HOME/.config/maxima/maxima-builtins-list.txt -r -D 2 maxima'
	alias    git='rlwrap -D 2 git'
	alias    nano='nvim'
	command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"  # use neovim for vim if present.
	alias    pizhid='ssh -l piz_hid 192.168.7.2'
