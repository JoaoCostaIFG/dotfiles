-- ifgdt apps

-- sync openrgb profile with sun schedule (Sakura day, Black night)
hl.on("hyprland.start", function()
    hl.exec_cmd(run_app .. " /home/joao/.local/bin/openrgb-night-sync")
end)