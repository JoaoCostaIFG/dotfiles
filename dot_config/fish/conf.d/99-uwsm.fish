# if login shell, start desktop

status is-login || exit

if uwsm check may-start
    # start desktop
    # use uwsm select to choose the default
    exec uwsm start default
end
