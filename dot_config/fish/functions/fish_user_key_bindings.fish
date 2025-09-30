function fish_user_key_bindings
    # lfcd bindings
    bind \ef 'commandline " lfcd" && commandline -f execute && commandline -f repaint'
    bind \ef -M insert 'commandline " lfcd" && commandline -f execute && commandline -f repaint'

    # copilot suggest
    # bind \ei -M insert 'commandline " gh copilot suggest -t shell" && commandline -f execute && commandline -f repaint'
    bind \ei -M insert 'ai_cmd_suggest "Suggest a command for the following description:"'
    bind \eI -M insert 'ai_cmd_suggest "Improve and/or fix the following command:"'

    # history bindings
    bind K history-prefix-search-backward
    bind J history-prefix-search-forward

    # pipe bindings
    # append | less and execute
    bind \el -M insert 'commandline -a "| less" && commandline -f execute'
    # prefix yes | and execute
    bind \ey -M insert 'commandline -C 0 && commandline -i "yes | " && commandline -f execute'
    # prefix sudo
    bind \es -M insert 'commandline -C 0 && commandline -i "sudo "'

    # make vi mode yanks copy to clipboard
    bind yy kill-whole-line yank_to_clipboard yank
    bind Y kill-whole-line yank_to_clipboard yank
    bind y,\$ kill-line yank_to_clipboard yank
    bind y,\^ backward-kill-line yank_to_clipboard yank
    bind y,0 backward-kill-line yank_to_clipboard yank
    bind y,w kill-word yank_to_clipboard yank
    bind y,W kill-bigword yank_to_clipboard yank
    bind y,i,w forward-single-char forward-single-char backward-word kill-word yank_to_clipboard yank
    bind y,i,W forward-single-char forward-single-char backward-bigword kill-bigword yank_to_clipboard yank
    bind y,a,w forward-single-char forward-single-char backward-word kill-word yank_to_clipboard yank
    bind y,a,W forward-single-char forward-single-char backward-bigword kill-bigword yank_to_clipboard yank
    bind y,e kill-word yank_to_clipboard yank
    bind y,E kill-bigword yank_to_clipboard yank
    bind y,b backward-kill-word yank_to_clipboard yank
    bind y,B backward-kill-bigword yank_to_clipboard yank
    bind y,g,e backward-kill-word yank_to_clipboard yank
    bind y,g,E backward-kill-bigword yank_to_clipboard yank
    bind y,f begin-selection forward-jump kill-selection yank_to_clipboard yank end-selection
    bind y,t begin-selection forward-jump-till kill-selection yank_to_clipboard yank end-selection
    bind y,F begin-selection backward-jump kill-selection yank_to_clipboard yank end-selection
    bind y,T begin-selection backward-jump-till kill-selection yank_to_clipboard yank end-selection
    bind y,h backward-char begin-selection kill-selection yank_to_clipboard yank end-selection
    bind y,l begin-selection kill-selection yank_to_clipboard yank end-selection
    bind y,i,b jump-till-matching-bracket and jump-till-matching-bracket and begin-selection jump-till-matching-bracket kill-selection yank_to_clipboard yank end-selection
    bind y,a,b jump-to-matching-bracket and jump-to-matching-bracket and begin-selection jump-to-matching-bracket kill-selection yank_to_clipboard yank end-selection
    bind y,i backward-jump-till and repeat-jump-reverse and begin-selection repeat-jump kill-selection yank_to_clipboard yank end-selection
    bind y,a backward-jump and repeat-jump-reverse and begin-selection repeat-jump kill-selection yank_to_clipboard yank end-selection
    bind -M visual -m default y kill-selection yank_to_clipboard yank end-selection repaint-mode
end
