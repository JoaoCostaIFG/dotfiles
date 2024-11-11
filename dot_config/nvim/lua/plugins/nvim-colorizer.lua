-- Description:  The fastest Neovim colorizer.
-- Source: https://github.com/norcalli/nvim-colorizer.lua
-- colors become colored

return {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "javascript", "typescript", "html" },
    opts = {
        "css",
        "javascript",
        "typescript",
        html = {
            mode = "foreground",
        },
    },
    lazy = true,
}