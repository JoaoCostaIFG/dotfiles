-- ifgdt apps

hl.on("hyprland.start", function()
	-- sync openrgb profile with sun schedule (Sakura day, Black night)
	hl.exec_cmd(run_app .. " /home/joao/.local/bin/openrgb-night-sync")
	-- Stream deck
	hl.exec_cmd(run_app .. " ~/.local/bin/Stream32.AppImage")
end)
