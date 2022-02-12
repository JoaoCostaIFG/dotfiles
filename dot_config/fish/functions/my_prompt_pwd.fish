function my_prompt_pwd
  basename (string replace -r '^'"$HOME"'$' '~' $PWD)
end

