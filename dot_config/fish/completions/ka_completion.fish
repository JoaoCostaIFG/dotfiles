# disable file name completion
complete -c ka -f
# complete process names
complete -c ka -a "(ps axch -o cmd)"
