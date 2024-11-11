-- Description: Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
-- Source: https://github.com/folke/twilight.nvim
-- the thing that dims colors in for zen-mode

return {
    "folke/twilight.nvim",
    init = function()
        vim.keymap.set("n", "<Leader>m", ":Twilight<CR>")
    end,
    opts = {
        on_open = function(_)
            vim.cmd("cabbrev <buffer> q let b:quitting = 1 <bar> q")
            vim.cmd("cabbrev <buffer> wq let b:quitting = 1 <bar> wq")
        end,
        on_close = function()
            if vim.b.quitting == 1 then
                vim.b.quitting = 0
                vim.cmd("q")
            end
        end,
    },
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
}