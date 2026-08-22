-- Set programs that you use
-- run_app is a global so override.d/* files (loaded later via require()) can
-- reference it; lua's require() isolates `local` declarations per file.
run_app = "uwsm app --"
term = run_app .. " $TERMINAL"
term_exec = run_app .. " $TERMINAL_EXEC"
file_manager = term_exec .. " lfcd_sh"
menu = run_app .. " vicinae toggle"

volume_toggle = run_app .. " pactl set-sink-mute @DEFAULT_SINK@ toggle"
volume_decrease = run_app .. " pactl set-sink-volume @DEFAULT_SINK@ -5%"
volume_increase = run_app .. " pactl set-sink-volume @DEFAULT_SINK@ +5%"
mic_toggle = run_app .. " pactl set-source-mute @DEFAULT_SOURCE@ toggle"

bright_decrease = run_app .. " noctalia msg brightness-down"
bright_increase = run_app .. " noctalia msg brightness-up"

player_pp = run_app .. " playerctl play-pause"
player_set0 = run_app .. " playerctl position 0"
player_prev = run_app .. " playerctl previous"
player_next = run_app .. " playerctl next"
player_skip_5 = run_app .. " playerctl position 0.05+"
player_rewind_5 = run_app .. " playerctl position 0.05-"

hl.on("hyprland.start", function()
	-- polkit agent
	hl.exec_cmd(run_app .. " /usr/lib/hyprpolkitagent/hyprpolkitagent")
	-- udiskie for automount
	hl.exec_cmd(run_app .. " udiskie")
	-- playerctl daemon
	hl.exec_cmd(run_app .. " playerctld")
	-- idle manager
	hl.exec_cmd(run_app .. " hypridle")

	-- desktop shell
	hl.exec_cmd(run_app .. " noctalia")
	-- menu
	hl.exec_cmd(run_app .. " vicinae server")
	-- email client
	hl.exec_cmd(run_app .. " thunderbird")
	-- remote desktop
	-- hl.exec_cmd(run_app .. " sunshine")
	-- easy effects
	-- hl.exec_cmd(run_app .. " easyeffects --gapplication-service")
end)
