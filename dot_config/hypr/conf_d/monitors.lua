-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Default monitor rule: applies to any monitor not matched by a more
-- specific rule (e.g. the per-output rules in override.d/monitors.lua).
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})
