function clnrep --description "Delete uninstalled packages and leave only last copy of installed ones"
    printf 'Cleaning uninstalled packages\n'
    sudo paccache -ruk0
    printf 'Leaving last version of installed packages\n'
    sudo paccache -rk1 $argv
end
