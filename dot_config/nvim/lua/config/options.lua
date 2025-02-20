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
o.ts = 2
o.sts = 2
o.sw = 2
o.expandtab = true

-- auto format on save
g.autoformat = true

-- disable animations: https://github.com/folke/snacks.nvim/blob/main/docs/animate.md
g.snacks_animate = false

-- Text behaviour (just don't like comment continuation)
-- o.formatoptions = o.formatoptions
--                    + 't'    -- auto-wrap text using textwidth
--                    + 'c'    -- auto-wrap comments using textwidth
--                    + 'r'    -- auto insert comment leader on pressing enter
--                    + 'o'    -- auto insert comment leader on pressing o
--                    + 'q'    -- format comments with gq
--                    + 'a'    -- autoformat the paragraphs
--                    + 'n'    -- autoformat numbered list
--                    - '2'    -- I am a programmer and not a writer
--                    + 'j'    -- Join comments smartly
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
