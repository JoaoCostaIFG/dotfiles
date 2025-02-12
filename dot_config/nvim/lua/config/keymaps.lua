-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--
-- KEYMAPS
--

local map = vim.keymap.set

map("", "<F15>", ":set list!<CR>", { silent = true })

-- Repeat last macro
map("", ",", "@@")

-- RIP-GREP
-- map("n", "_", ":Telescope live_grep<CR>")

--
-- commandS
--

local function cmd(command, code, description)
  vim.api.nvim_create_user_command(command, code, { desc = description })
end

-- Save File and Exits
cmd("E", "e", "Edit file (same as e)")
cmd("WQ", "wq", "Save and quit (same as wq)")
cmd("Wq", "wq", "Save and quit (same as wq)")
cmd("W", "w", "Save (same as w)")
cmd("Q", "q", "Quit (same as q)")
