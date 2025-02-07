local function cmd(command, code, description)
    vim.api.nvim_create_user_command(command, code, { desc = description })
end

-- Save File and Exits
cmd("E", "e", "Edit file (same as e)")
cmd("WQ", "wq", "Save and quit (same as wq)")
cmd("Wq", "wq", "Save and quit (same as wq)")
cmd("W", "w", "Save (same as w)")
cmd("Q", "q", "Quit (same as q)")

-- strip white spaces
cmd(
    "StripTrailWhiteChars",
	'call Preserve("%s/\\s\\+$//e")',
	"Strip white space in file"
)
