-- load plugins
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpm reload -n")
end)

-- hyprtags config (workspace tag system emulating DWM).
-- Registered via addConfigValueV2 with key "plugin:hyprtags:main_display".
hl.config({
	plugin = {
		hyprtags = {
			main_display = "DP-1",
		},
	},
})
