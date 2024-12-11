-- Description: A lua powered greeter like vim-startify / dashboard-nvim.
-- Source: https://github.com/goolord/alpha-nvim

return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        return require("alpha.themes.startify").config
    end,
}
