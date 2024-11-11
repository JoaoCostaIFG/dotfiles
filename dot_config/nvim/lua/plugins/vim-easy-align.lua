-- Description: A Vim alignment plugin.
-- Source: https://github.com/junegunn/vim-easy-align

return {
    "junegunn/vim-easy-align",
    keys = { "ga", { "ga", mode = "x" } },
    init = function()
        vim.keymap.set("n", "ga", ":EasyAlign<CR>")
        vim.keymap.set("x", "ga", ":EasyAlign<CR>")
    end,
    lazy = true,
}