-- Description: Distraction-free coding for Neovim.
-- Source: https://github.com/folke/zen-mode.nvim
-- the writting focus thing

return
{
    "folke/zen-mode.nvim",
    init = function()
        vim.keymap.set("n", "<Leader>n", ":ZenMode<CR>")
    end,
}