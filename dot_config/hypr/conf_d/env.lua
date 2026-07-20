-- Some default env vars.
-- these XDG vars should be set automatically but we set them here as well (just in case)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- cursor theme
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "XCursor-Pro-Dark")
hl.env("HYPRCURSOR_THEME", "XCursor-Pro-Dark-Hyprcursor")

-- X11 theme stuff
hl.exec_cmd('xrdb -load "$HOME/.Xdefaults"')
-- theme settings for GTK 4
hl.exec_cmd("import-gsettings")
