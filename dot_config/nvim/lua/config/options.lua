-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local o = vim.opt

o.scrolloff = 5 -- Lines of context
o.hlsearch = false
o.autoindent = true -- Copy indent from current line when starting a new line
o.listchars:append({ lead = "⋅" })
o.ts = 2
o.sts = 2
o.sw = 2
o.expandtab = true
