-- ifg apps

hl.on("hyprland.start", function()
	-- password manager
	hl.exec_cmd(run_app .. " bitwarden-desktop")
	-- XPPen drawing table
	-- hl.exec_cmd(run_app .. ' QT_QPA_PLATFORM="xcb" /usr/lib/pentablet/PenTablet.sh /mini')
end)
