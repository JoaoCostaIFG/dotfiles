-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

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

-- substitute all non-ascii chars by a space
function RM_non_ascii()
  vim.cmd("%s/[^[:alnum:][:punct:][:space:]]/ /g")
end
