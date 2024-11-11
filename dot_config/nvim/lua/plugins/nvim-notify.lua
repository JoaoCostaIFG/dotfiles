-- Description: A fancy, configurable, notification manager for NeoVim
-- Source: https://github.com/rcarriga/nvim-notify
-- cute notifications

return {
    "rcarriga/nvim-notify",
    config = function()
        vim.notify = require("notify")
        if vim.fn.has("termguicolors") then
            vim.notify.setup({ background_colour = "#000000" })
        else
            vim.notify.setup()
        end
    end,
    lazy = true,
}