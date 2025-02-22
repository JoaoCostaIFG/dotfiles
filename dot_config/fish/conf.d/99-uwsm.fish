# if login shell, start desktop
if status is-login && uwsm check may-start
    # start desktop
    exec uwsm start hyprland.desktop
end
