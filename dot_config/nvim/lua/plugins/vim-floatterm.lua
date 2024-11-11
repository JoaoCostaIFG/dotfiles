-- Description: Terminal manager for (neo)vim.
-- Source: https://github.com/voldikss/vim-floaterm

return {
    "voldikss/vim-floaterm",
    init = function()
        vim.g.floaterm_opener = "edit"
    end,
}