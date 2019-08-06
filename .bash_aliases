# ALIAS #
	alias    lhome='ls -lAh --group-directories-first --color=auto $HOME'
	alias    ls='ls --group-directories-first --color=auto'
  	alias    ll='ls -lh --group-directories-first --color=auto'
  	alias    lll='ls -lAh --group-directories-first --color=auto'

	alias    fperm='chmod 644'
	alias    dperm='chmod 755'
	alias    dsize='du -sh'

	alias    grep='grep --color=auto'
	alias    fgrep='fgrep --color=auto'
	alias    egrep='egrep --color=auto'

	alias    dir='dir --color=auto'
	alias    vdir='vdir --color=auto'

	alias    diff='diff --color=auto'
	alias    rm='rm -I'
  	alias    ka='killall'
  	alias    bye='shutdown now'
	alias    byer='shutdown -r now'

	alias    clndep='sudo pacman -R $(pacman -Qdtq)'
  	alias    clnrep='printf "Cleaning uninstalled packages\n"; sudo paccache -ruk0; printf "Leaving last version of installed packages\n"; sudo paccache -rk1'
  	alias    yay='yay --aur'    # prevent partial upgrades

	alias    raposoflamejante='firefox &'
  	alias    calcurse='calcurse -D $HOME/Documents/calcurse -C $HOME/.config/calcurse'
	alias	 maxima='rlwrap -c -H $HOME/.config/maxima/maxima-history -f $HOME/.config/maxima/maxima-builtins-list.txt -r -D 2 maxima'

	alias    yt='youtube-dl --add-metadata -ic'
	alias    yta='youtube-dl --add-metadata -xic'

	alias    nano='nvim'
	command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d" # Use neovim for vim if present.

