-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules

hl.window_rule({
	name = "disable-maximize-animation",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "disable-minimize-animation",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "no-border-when-only",
	match = { float = true },
	border_size = 0,
})

-- special workspaces
hl.window_rule({
	name = "thunderbird-workspace",
	match = { class = "^(org.mozilla.Thunderbird)$" },
	workspace = "special:thunderbird silent",
})

-- xwaylandvideobridge hide
hl.window_rule({
	name = "xwaylandvideobridge-hide",
	match = { class = "^(xwaylandvideobridge)$" },
	opacity = "0.0 override",
	no_anim = true,
	no_initial_focus = true,
	max_size = "1 1",
	no_blur = true,
})

-- "Smart gaps" / "No gaps when only"
hl.workspace_rule({ workspace = "w[t1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "w[tg1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({
	name = "smart-gaps-t1",
	match = { workspace = "w[t1]", float = false },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "smart-gaps-tg1",
	match = { workspace = "w[tg1]", float = false },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "smart-gaps-f1",
	match = { workspace = "f[1]", float = false },
	border_size = 0,
	rounding = 0,
})

-- fake fullscreen
hl.window_rule({
	name = "fake-fullscreen",
	match = { class = "(firefox|librewolf|vesktop|discord)" },
	fullscreen_state = "0 1",
	sync_fullscreen = false,
})

-- vicinae
hl.layer_rule({
	name = "vicinae",
	match = { namespace = "vicinae" },
	blur = true,
	ignore_alpha = 0,
})

-- satty
hl.window_rule({
	name = "satty-always-float",
	match = { class = [[^(com\.gabm\.satty)$]] },
	float = true,
})

-- hyprland share picker
hl.window_rule({
	name = "hyprland-share-picker-float",
	match = { class = "^(hyprland-share-picker)$" },
	float = true,
})
