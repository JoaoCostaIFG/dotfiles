-- Description: A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- Source: https://github.com/nvim-lualine/lualine.nvim

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        icons_enabled = true,
        theme = "everforest",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        tabline = {},
    },
}