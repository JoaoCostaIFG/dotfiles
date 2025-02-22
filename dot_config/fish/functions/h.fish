function h -d "Get help text from my scripts"
    # Idea from: https://samizdat.dev/help-message-for-shell-scripts
    sed -rn 's/^### ?//;T;p' $argv
end
