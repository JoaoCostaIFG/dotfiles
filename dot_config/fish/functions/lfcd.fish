function lfcd --description "Opens lf and cd's to the current folder on exit"
    set tmp (mktemp | string collect; or echo)
    lf -last-dir-path="$tmp" "$argv"
    # cleanup terminal window name changes (not standard)
    printf '\\033]0;st\\007' >/dev/tty
    if [ -f "$tmp" ]
        set dir (cat "$tmp" | string collect; or echo)
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != (pwd | string collect; or echo) ] && cd "$dir"
    end
end
