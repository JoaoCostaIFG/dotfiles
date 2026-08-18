-- Key bindings
--
-- Mod list: SHIFT CAPS CTRL/CONTROL ALT MOD2 MOD3 SUPER/WIN/LOGO/MOD4 MOD5
-- Key list: https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h
-- (use the segment after XKB_KEY_)
--
-- NOTE: key names are preserved verbatim from the old hyprlang config. If any
-- bind fails to register after reload (check `hyprctl binds` / Hyprland logs),
-- verify the keysym casing — the lua API is case-sensitive and expects the
-- canonical xkbcommon name.
local mod = "SUPER"

-- Globals defined in conf.d/apps.lua (loaded before this file via require()
-- in hyprland.lua): run_app, term, term_exec, file_manager, menu,
-- volume_toggle/decrease/increase, mic_toggle, bright_decrease/increase,
-- player_pp/set0/prev/next/skip_5/rewind_5.

--
-- Basics:
--
hl.bind(mod .. " + SHIFT + CONTROL + Q", hl.dsp.exec_cmd("uwsm stop"))
-- reload Hyprland
hl.bind(mod .. " + SHIFT + CONTROL + R", hl.dsp.exec_cmd(run_app .. " hyprctl reload"))
-- kill focused window
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mod .. " + Q", hl.dsp.window.close())
-- lock screen
hl.bind(mod .. " + F11", hl.dsp.exec_cmd(run_app .. " loginctl lock-session"))
-- suspend
hl.bind(mod .. " + F12", hl.dsp.exec_cmd(run_app .. " systemctl suspend"))
-- toggle bar
hl.bind(mod .. " + B", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call bar toggle"))

--
-- Apps:
--
-- terminal
hl.bind(mod .. " + T", hl.dsp.exec_cmd(term))
hl.bind(mod .. " + SHIFT + T", hl.dsp.exec_cmd(run_app .. " foot")) -- the fallback term
-- app launcher
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(menu))
-- other
hl.bind(mod .. " + C", hl.dsp.exec_cmd(term_exec .. " numbat"))
hl.bind(mod .. " + SHIFT + C", hl.dsp.exec_cmd(term_exec .. " mmaxima"))
hl.bind(mod .. " + E", hl.dsp.workspace.toggle_special("thunderbird"))
hl.bind(mod .. " + F", hl.dsp.exec_cmd(file_manager))
hl.bind(mod .. " + SHIFT + F", hl.dsp.exec_cmd(run_app .. " thunar"))
hl.bind(mod .. " + M", hl.dsp.exec_cmd(run_app .. " dmount"))
hl.bind(mod .. " + N", hl.dsp.exec_cmd(run_app .. " cfait-gui"))
hl.bind(mod .. " + Y", hl.dsp.exec_cmd(run_app .. " bitwarden-desktop"))
hl.bind(mod .. " + SHIFT + N", hl.dsp.exec_cmd(run_app .. " joplin"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd(run_app .. " gimp"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(run_app .. " $BROWSER"))
hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd(run_app .. " chromium")) -- the fallback browser
hl.bind(mod .. " + S", hl.dsp.exec_cmd(run_app .. " strawberry"))
hl.bind(mod .. " + W", hl.dsp.exec_cmd(term_exec .. " nvim"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd(run_app .. " qs -c noctalia-shell ipc call plugin:screen-recorder toggle"))

--
-- Media keys:
--
-- audio
hl.bind(mod .. " + F1", hl.dsp.exec_cmd(volume_toggle))
hl.bind(mod .. " + F2", hl.dsp.exec_cmd(volume_decrease))
hl.bind(mod .. " + F3", hl.dsp.exec_cmd(volume_increase))
hl.bind(mod .. " + SHIFT + F1", hl.dsp.exec_cmd(mic_toggle))
hl.bind(mod .. " + SHIFT + F2", hl.dsp.exec_cmd(run_app .. " next_sink.sh"))
--
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(volume_toggle))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volume_decrease))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volume_increase))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(mic_toggle))
hl.bind("SHIFT + XF86AudioMute", hl.dsp.exec_cmd(mic_toggle))
-- display
hl.bind(mod .. " + F4", hl.dsp.exec_cmd(bright_decrease))
hl.bind(mod .. " + F5", hl.dsp.exec_cmd(bright_increase))
--
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(bright_decrease))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(bright_increase))
-- media
hl.bind(mod .. " + F6", hl.dsp.exec_cmd(player_pp))
hl.bind(mod .. " + SHIFT + F6", hl.dsp.exec_cmd(player_set0))
hl.bind(mod .. " + F7", hl.dsp.exec_cmd(player_prev))
hl.bind(mod .. " + SHIFT + F7", hl.dsp.exec_cmd(player_skip_5))
hl.bind(mod .. " + F8", hl.dsp.exec_cmd(player_next))
hl.bind(mod .. " + SHIFT + F8", hl.dsp.exec_cmd(player_rewind_5))
--
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(player_pp))
hl.bind("SHIFT + XF86AudioPlay", hl.dsp.exec_cmd(player_set0))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(player_prev))
hl.bind("SHIFT + XF86AudioPrev", hl.dsp.exec_cmd(player_skip_5))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(player_next))
hl.bind("SHIFT + XF86AudioNext", hl.dsp.exec_cmd(player_rewind_5))
--
hl.bind("XF86Search", hl.dsp.exec_cmd(menu))

--
-- Notifications:
--
hl.bind(mod .. " + F10", hl.dsp.exec_cmd(run_app .. " qs -c noctalia-shell ipc call notifications toggleDND")) -- toggle dnd
hl.bind(mod .. " + backspace", hl.dsp.exec_cmd(run_app .. " qs -c noctalia-shell ipc call notifications dismissOldest")) -- dismiss last
hl.bind(mod .. " + SHIFT + backspace", hl.dsp.exec_cmd(run_app .. " qs -c noctalia-shell ipc call notifications clear")) -- dismiss all
hl.bind(
	mod .. " + CONTROL + backspace",
	hl.dsp.exec_cmd(run_app .. " qs -c noctalia-shell ipc call notifications toggleHistory")
) -- show notifications

--
-- Screenshots:
--
hl.bind(
	mod .. " + SHIFT + S",
	hl.dsp.exec_cmd(run_app .. " qs -c noctalia-shell ipc call plugin:screen-shot-and-record screenshot")
)
hl.bind("Print", hl.dsp.exec_cmd(run_app .. " qs -c noctalia-shell ipc call plugin:screen-shot-and-record screenshot"))
hl.bind(
	mod .. " + Print",
	hl.dsp.exec_cmd(run_app .. " qs -c noctalia-shell ipc call plugin:screen-shot-and-record ocr")
)
hl.bind(
	mod .. " + SHIFT + Print",
	hl.dsp.exec_cmd(run_app .. " qs -c noctalia-shell ipc call plugin:screen-shot-and-record search")
)

--
-- Movement:
--
-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- move focus
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
-- tab
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind("CONTROL + Tab", hl.dsp.window.cycle_next({ direction = "prev" }))
-- move focused window
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

--
-- Workspaces (hyprtags plugin dispatchers — native lua bindings under
-- hl.plugin.hyprtags.*; the plugin registers them via HyprlandAPI::addLuaFunction,
-- so they're called like ordinary lua functions, not via hl.dsp).
--
-- Switch workspaces with mod + [0-9]
for i = 1, 9 do
	hl.bind(mod .. " + " .. i, function()
		hl.plugin.hyprtags.tags_workspace(i)
	end)
end
-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 9 do
	hl.bind(mod .. " + SHIFT + " .. i, function()
		hl.plugin.hyprtags.tags_move_to_workspace_silent(i)
	end)
end
-- Borrow workspaces
for i = 1, 9 do
	hl.bind(mod .. " + CONTROL + " .. i, function()
		hl.plugin.hyprtags.tags_toggle_workspace(i)
	end)
end
-- workspace alt-tab
hl.bind(mod .. " + Tab", function()
	hl.plugin.hyprtags.tags_workspace_alt_tab()
end)

-- focus next/prev output
hl.bind(mod .. " + Comma", hl.dsp.focus({ monitor = "-1" }))
hl.bind(mod .. " + Period", hl.dsp.focus({ monitor = "+1" }))
-- move to monitor
hl.bind(mod .. " + SHIFT + Comma", hl.dsp.window.move({ monitor = "-1" }))
hl.bind(mod .. " + SHIFT + Period", hl.dsp.window.move({ monitor = "+1" }))

--
-- Layouts:
--
hl.bind(mod .. " + Space", hl.dsp.window.fullscreen())
hl.bind(mod .. " + SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))

--
-- Passthrough mode:
--
hl.bind(mod .. " + Escape", hl.dsp.submap("passthru"))

hl.define_submap("passthru", function()
	hl.bind(mod .. " + Escape", hl.dsp.submap("reset"))
end)
