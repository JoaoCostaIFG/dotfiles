# AI Suggest Plugin Configuration
# Automatically suggests the next command after each execution
status is-interactive || exit

# Initialize state variables (use universal for cross-process communication)
set -g __ai_suggestion_loading false
set -g __ai_last_cmd ""
set -g __ai_suggestion_pid 0

# Initialize universal variable if not set
if not set -q __ai_suggestion
    set -U __ai_suggestion ""
end

# Define the postexec handler inline (event handlers must be defined at load time)
function ai_suggest_postexec --on-event fish_postexec
    # Capture status immediately (before any other commands change it)
    set -l exit_status $status
    set -l cmd $argv[1]

    # Skip empty commands
    if test -z "$cmd"
        return
    end

    # Skip if same as last command (avoid loops)
    if test "$cmd" = "$__ai_last_cmd"
        return
    end
    set -g __ai_last_cmd "$cmd"

    # Clear previous suggestion
    set -U __ai_suggestion ""
    set -g __ai_suggestion_loading true

    # Kill any existing background job
    if test "$__ai_suggestion_pid" -ne 0
        kill $__ai_suggestion_pid 2>/dev/null
    end

    # Start background fetch with exit status and current directory
    fish -c "ai_suggest_fetch $(string escape -- $cmd) $(string escape -- $exit_status) $(string escape -- $PWD)" &
    set -g __ai_suggestion_pid $last_pid
    disown $last_pid 2>/dev/null

    # Repaint to show loading state
    commandline -f repaint
end

# Watch for suggestion updates from background process and repaint
function __ai_suggest_on_update --on-variable __ai_suggestion
    # Only repaint if commandline is empty (user hasn't started typing)
    if test -z (commandline)
        commandline -f repaint
    end
    # Also update loading state
    set -g __ai_suggestion_loading false
end

# Override fish_right_prompt to show AI suggestions
# This runs after starship (50-starship.fish) so it takes precedence
function fish_right_prompt
    # Clear suggestion if user has started typing (clear on typing behavior)
    set -l current_cmd (commandline)
    if test -n "$current_cmd"
        # User is typing, clear the suggestion
        if test -n "$__ai_suggestion"
            set -U __ai_suggestion ""
        end
        return
    end

    # Show AI suggestion state
    if test "$__ai_suggestion_loading" = true
        set_color brblack
        echo -n "  thinking..."
        set_color normal
    else if test -n "$__ai_suggestion"
        set_color brblack
        echo -n "  -> "(string shorten -m 60 "$__ai_suggestion")
        set_color normal
    end
end

# Keybindings - Ctrl+G to accept suggestion (works in all modes)
bind \cg ai_suggest_accept
bind \cg -M insert ai_suggest_accept
