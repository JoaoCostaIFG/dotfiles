# This will read the file with environment variables and
# process the lines so they can be run on fish
#
set -gx GPG_TTY $(tty)

status is-login || exit

replay source "$HOME/.profile"

# important files and directories
set -gx SCRIPTS "$HOME/.local/bin/"

# langs
set -gx UV_TOOL_BIN_DIR "$SCRIPTS/uv"
set -gx CARGO_HOME "$HOME/.local/share/cargo"
set -gx GOPATH "$HOME/.local/share/go"
set -gx PNPM_HOME "$HOME/.local/share/pnpm"

# PATH (Go, Rust, PNPM, local/bin)
fish_add_path "$SCRIPTS" "$SCRIPTS/dmenu" "$UV_TOOL_BIN_DIR" "$CARGO_HOME/bin" "$GOPATH/bin" "$PNPM_HOME"

# my scripts
set -gx DRECORD_SAVEDIR "$HOME/Videos"
set -gx DTODO_DFLT_FILE "$HOME/Documents/Notes/dtodo_notes/TODO.txt"
set -gx SCREENSHOT_SAVEDIR "$HOME/Pictures/screenshots/"

# default programs
set -gx BROWSER firefox
set -gx EDITOR nvim
set -gx FILE lfcd_sh
set -gx OPENER xdg-open
set -gx PAGER "bat -p"
set -gx READER zathura
set -gx TERMINAL kitty
set -gx TERMINAL_EXEC "kitty -e"
set -gx VISUAL nvim
set -gx LS eza
set -gx NACHOS cute

# clean-up
set -gx GTK2_RC_FILES "$HOME/.config/gtk-2.0/gtkrc-2.0"
set -gx LESSHISTFILE -
set -gx WGETRC "$HOME/.config/wget/wgetrc"
set -gx INPUTRC "$HOME/.config/inputrc"
set -gx MAXIMA_USERDIR "$HOME/.config/maxima"
set -gx SQLITE_HISTORY "$HOME/.local/share/sqlite_history"
set -gx DOCKER_CONFIG "$HOME/.config/docker"

# other program settings
set -gx LESS -iFMRSX
#set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
#set -gx SSH_AUTH_SOCK "$HOME/.bitwarden-ssh-agent.sock"
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 40%"
set -gx QT_QPA_PLATFORMTHEME qt5ct
# set -gx QT_STYLE_OVERRIDE kvantum
set -gx COLORTERM truecolor # advertise truecolor
set -gx BEMENU_OPTS "-i -w -H 34 -p '' --hp 8 --tb '#3b4252' --tf '#d8dee9 --nb '#0b0a18' --nf '#d8dee9' --hb '#3b4252' --hf '#d8dee9'"

# wayland
set -gx QT_QPA_PLATFORM "wayland;xcb"
set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -gx GDK_BACKEND 'wayland,x11,*'
# disabled because it breaks older games
# set -gx SDL_VIDEODRIVER wayland
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx MOZ_ENABLE_WAYLAND 1
set -gx MOZ_DBUS_REMOTE 1
set -gx ELECTRON_OZONE_PLATFORM_HINT auto
# use UWSM's custom slices:
set -gx APP2UNIT_SLICES 'a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice'
