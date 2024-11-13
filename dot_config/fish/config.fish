# If not running interactively, don't do anything #
if status is-login
  ssh-agent | babelfish | source >/dev/null
  startw
  exit
end

# Vi
fish_vi_key_bindings
# search history with Control-R when in insert mode
bind --mode insert \cr 'history-pager'
set fish_escape_delay_ms 10
# Emulates vim's cursor shape behavior
set fish_cursor_default block           # set the normal and visual mode cursors to a block
set fish_cursor_insert line             # set the insert mode cursor to a line
set fish_cursor_replace underscore      # Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore 
set fish_cursor_visual block blink       # Set the visual mode cursor to a blinking block

# go back any number of dirs: .., ..., ...., etc...
abbr --add dotdot --regex '^\.\.+$' --function multicd

# starship
if command -v starship >/dev/null
  starship init fish --print-full-init | source
end
