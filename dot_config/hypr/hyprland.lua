-- Hyprland config (v0.55+ Lua format)
-- Entry point; modular config is loaded via file().
--
-- Load order mirrors the old hyprland.conf `source =` lines:
--   1. runtime hyprtags config emitted by the hyprtags plugin
--   2. ./conf.d/*.lua        (alphabetical)
--   3. ./override.d/*.lua    (alphabetical)
--   4. ./noctalia/noctalia-colors.lua
--

-- Runtime config emitted by the hyprtags plugin (workspace rules per monitor).
-- pcall so a missing file on first launch doesn't abort config loading.
local sig = os.getenv("HYPRLAND_INSTANCE_SIGNATURE") or ""
local runtime_dir = os.getenv("XDG_RUNTIME_DIR") or ""
if sig ~= "" and runtime_dir ~= "" then
	local path = runtime_dir .. "/hypr/" .. sig .. "/hyprtags.lua"
	local f = io.open(path, "r")
	if f then
		f:close()
		pcall(dofile, path)
	end
end

require("conf_d.apps")
require("conf_d.binds")
require("conf_d.env")
require("conf_d.monitors")
require("conf_d.plugins")
require("conf_d.rules")
require("conf_d.settings")

require("override_d.apps")
require("override_d.gitkeep")
require("override_d.ifgdt-apps")
require("override_d.monitors")

require("noctalia.noctalia-colors")
