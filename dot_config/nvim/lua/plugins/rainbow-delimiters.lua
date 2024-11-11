-- Description: Rainbow delimiters for Neovim with Tree-sitter
-- Source: https://gitlab.com/HiPhish/rainbow-delimiters.nvim
-- rainbow parentheses

return {
    "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    config = function()
        local rainbow_delimiters = require("rainbow-delimiters")
        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy["global"],
                vim = rainbow_delimiters.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
            },
            highlight = {
                "RainbowDelimiterYellow",
                "RainbowDelimiterBlue",
                "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterOrange",
                "RainbowDelimiterCyan",
                "RainbowDelimiterRed",
            },
        }
    end,
}