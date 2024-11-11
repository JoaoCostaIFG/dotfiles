local global = vim.g
local o = vim.opt

if o.shell:get():sub(-#"fish") == "fish" then
    o.shell = "/bin/bash"
end

global.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct
if vim.fn.has("termguicolors") then
    o.termguicolors = true
end

vim.cmd([[filetype plugin on]])

o.compatible = false
o.listchars:append({ lead = "⋅" })
o.ts = 2
o.sts = 2
o.sw = 2
o.expandtab = true
o.number = true
o.relativenumber = true
o.wildmenu = true -- When on, cmdline completion operates in an enhanced mode
o.syntax = "on" -- When this option is set, the syntax with this name is loaded
o.mouse = "a"
o.mousemoveevent = true
o.scrolloff = 5
o.cmdheight = 2
o.updatetime = 300
o.shortmess = "a"
o.signcolumn = "yes" -- always show sign column (no shift when diagnostics run)
o.encoding = "UTF-8"
o.splitright = true
o.splitbelow = true
o.hlsearch = false
o.ignorecase = true
o.smartcase = true
o.autoindent = true -- Copy indent from current line when starting a new line
o.clipboard:append("unnamedplus")
o.hidden = true

-- backup stuff
vim.cmd([[
set backupcopy=yes
if exists('$SUDO_USER')
  " don't create root owned files
  set nobackup
  set nowritebackup
  set noswapfile
  set noundofile
else
  " protect against crash-during-write
  set writebackup
  " but do not persist backup after successful write
  set nobackup

  set swapfile
  set directory^=~/.local/share/nvim/swap//

  " persist the undo tree for each file
  set undofile
  set undodir^=~/.local/share/nvim/undo//
endif
]])

-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
