-- Hyprland config (v0.55+ Lua format)
-- Entry point; modular config is loaded via file().
--
-- Load order mirrors the old hyprland.conf `source =` lines:
--   1. runtime hyprtags config emitted by the hyprtags plugin
--   2. ./conf.d/*.lua        (alphabetical)
--   3. ./override.d/*.lua    (alphabetical)
--   4. ./noctalia.lua
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

-- Require every *.lua file in a subdirectory, in alphabetical order.
-- The subdirectory name doubles as the require prefix, e.g.
-- require_dir("conf_d") -> require("conf_d.01-apps"), etc.
-- Uses the directory of this entry file (resolved via debug.getinfo) so the
-- listing works regardless of Hyprland's process cwd.
local script_dir = debug.getinfo(1, "S").source:sub(2):match("^(.*)/[^/]+$") or "."
local function require_dir(dir)
	local p = io.popen('ls "' .. script_dir .. "/" .. dir .. '"')
	if not p then
		return
	end
	local names = {}
	for name in p:lines() do
		if name:sub(-4) == ".lua" then
			names[#names + 1] = name:sub(1, -5)
		end
	end
	p:close()
	table.sort(names)
	for _, name in ipairs(names) do
		require(dir .. "." .. name)
	end
end

require_dir("conf_d")
require_dir("override_d")

-- For Noctalia Color templates
require("noctalia").apply_theme()
