function fish_user_key_bindings
  # lfcd bindings
  bind \ef 'commandline "lfcd" && commandline -f execute && commandline -f repaint'
  bind \ef -M insert 'commandline "lfcd" && commandline -f execute && commandline -f repaint'

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
end

