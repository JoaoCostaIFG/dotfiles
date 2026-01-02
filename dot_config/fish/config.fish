# theme event handler, updates the theme for all fish shells running
# to set the theme: `set -U my_theme <the_theme>`
# to show all available themes: `fish_config theme show`
fish_config theme choose $my_theme
function apply-my-theme --on-variable=my_theme
    fish_config theme choose $my_theme
end

# Vi
fish_vi_key_bindings
# search history with Control-R when in insert mode
bind --mode insert \cr history-pager
set fish_escape_delay_ms 10
# Emulates vim's cursor shape behavior
set fish_cursor_default block # set the normal and visual mode cursors to a block
set fish_cursor_insert line # set the insert mode cursor to a line
set fish_cursor_visual block # Set the visual mode cursor to a block
# Set the replace mode cursor to an underscore
set fish_cursor_replace underscore
set fish_cursor_replace_one underscore
# Setting this because fish's fish_vi_cursor is not detecting ghostty's term capabilities
set fish_vi_force_cursor

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore

# placed here to ensure it loads after other config files
if status is-interactive && command -v atuin >/dev/null
    atuin init fish --disable-up-arrow | source
end
