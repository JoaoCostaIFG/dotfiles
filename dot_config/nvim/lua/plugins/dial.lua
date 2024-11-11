-- Description: Enhanced increment/decrement plugin for Neovim.
-- Source: https://github.com/monaqa/dial.nvim

return {
    "monaqa/dial.nvim",
    keys = { "<C-a>", "<C-x>" },
    init = function()
        local augend = require("dial.augend")
        local map = require("dial.map")
        vim.keymap.set("n", "<C-a>", map.inc_normal(), { noremap = true })
        vim.keymap.set("n", "<C-x>", map.dec_normal(), { noremap = true })
        vim.keymap.set("n", "g<C-a>", map.inc_gnormal(), { noremap = true })
        vim.keymap.set("n", "g<C-x>", map.dec_gnormal(), { noremap = true })
        vim.keymap.set("v", "<C-a>", map.inc_visual(), { noremap = true })
        vim.keymap.set("v", "<C-x>", map.dec_visual(), { noremap = true })
        vim.keymap.set("v", "g<C-a>", map.inc_gvisual(), { noremap = true })
        vim.keymap.set("v", "g<C-x>", map.dec_gvisual(), { noremap = true })
    end,
}