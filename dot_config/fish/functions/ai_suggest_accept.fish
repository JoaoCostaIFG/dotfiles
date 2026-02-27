function ai_suggest_accept
    # Capture suggestion before any repaint clears it
    set -l suggestion "$__ai_suggestion"
    
    if test -n "$suggestion"
        # Clear the suggestion first
        set -U __ai_suggestion ""
        # Set the commandline
        commandline -r "$suggestion"
        commandline -f end-of-line
        commandline -f repaint
    end
end
