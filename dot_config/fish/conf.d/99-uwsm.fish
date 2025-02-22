# if login shell, start desktop

status is-login || exit

if uwsm check may-start
    # start desktop
    exec uwsm start hyprland.desktop
end
