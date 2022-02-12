function fish_prompt
  echo -n -s (tput bold) (set_color red) "[" (set_color cyan) (my_prompt_pwd) (set_color red) "]" \
    (set_color magenta) (fish_vcs_prompt)

  # end of prompt symbol
  set_color green
  switch $fish_bind_mode
    case default
      echo -n '><> '
    case insert
      echo -n '<>< '
    case replace_one
      echo -n 'r>< '
    case replace
      echo -n 'R>< '
    case visual
      echo -n '><v '
    case '*'
      echo -n '<>< '
  end
  set_color normal
end
