function multicd --description "go back any number of dirs: ..=cd .., ...=cd ../.., ....=cd ../../.., etc."
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
