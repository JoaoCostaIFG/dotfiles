-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local o = vim.opt

o.scrolloff = 5 -- Lines of context
o.hlsearch = true
o.autoindent = true -- Copy indent from current line when starting a new line
o.listchars:append({ lead = "⋅" })
-- tab size=2 and use spaces instead of tab chars
-- o.ts = 2
-- o.sts = 2
-- o.sw = 2
-- o.expandtab = true

-- auto format on save
g.autoformat = true

-- disable animations: https://github.com/folke/snacks.nvim/blob/main/docs/animate.md
g.snacks_animate = false
