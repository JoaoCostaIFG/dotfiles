# If not running interactively, don't do anything #
status is-interactive || exit

# Vi
fish_vi_key_bindings
set fish_escape_delay_ms 10
# Emulates vim's cursor shape behavior
set fish_cursor_default block           # set the normal and visual mode cursors to a block
set fish_cursor_insert line             # set the insert mode cursor to a line
set fish_cursor_replace underscore      # Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore 
set fish_cursor_visual block blink       # Set the visual mode cursor to a blinking block
