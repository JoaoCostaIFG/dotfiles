function get_gitignore --argument lang --description 'Get a .gitignore file from github/gitignore'
    set lang (curl -s 'https://api.github.com/repos/github/gitignore/git/trees/main?recursive=true' | jq -r '.tree | .[] | select(.type == "blob") | .path' | fzf -q $lang | string collect; or echo)
    if test -z "$lang"
        warn -e "No language selected"
        return 1
    end
    wget -O '.gitignore' "https://raw.githubusercontent.com/github/gitignore/refs/heads/main/$lang"
end
