-- For all categories, see https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "compose:ralt",
		kb_rules = "",
		repeat_rate = 50,
		repeat_delay = 300,

		follow_mouse = 1,

		accel_profile = "flat",

		touchpad = {
			natural_scroll = false,
			middle_button_emulation = false,
			tap_button_map = "lrm",
		},

		sensitivity = 0, -- -1.0 to 1.0, 0 means no modification.

		tablet = {
			output = "DP-1",
		},
	},
})

hl.config({
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
})

hl.config({
	general = {
		-- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more

		gaps_in = 3,
		gaps_out = 3,
		border_size = 1,
		resize_on_border = true,
		col = {
			active_border = { colors = { "rgba(ef926eee)", "rgba(8ad3eaee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		layout = "dwindle",

		-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
		allow_tearing = true,
	},
})

hl.config({
	decoration = {
		-- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more

		rounding = 0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 25,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 3,
			popups = true,
			input_methods = true,
		},
	},
})

hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.config({
	dwindle = {
		-- if enabled, the split (side/top) will not change regardless of what happens to the container
		preserve_split = false,
		-- 0 -> split follows mouse, 1 -> always split to the left (new = left or top) 2 -> always split to the right (new = right or bottom)
		force_split = 2,
	},
})

hl.config({
	master = {
		orientation = "center",
		slave_count_for_center_master = 0,
	},
})

hl.config({
	gestures = {
		-- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more
		workspace_swipe_touch = false,
	},
})

hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,

		-- Variable refresh rate of the monitor: 0 - off, 1 - on, 2 - fullscreen only
		vrr = 2,

		animate_manual_resizes = true,
		animate_mouse_windowdragging = true,

		enable_anr_dialog = false,
	},
})

hl.config({
	debug = {
		disable_logs = true,
	},
})
