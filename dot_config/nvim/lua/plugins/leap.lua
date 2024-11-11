-- Description: Leap is a general-purpose motion plugin for Neovim, building and improving primarily on vim-sneak.
-- Source: https://github.com/ggandor/leap.nvim
-- general-purpose motion plugin

return {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" }, -- repeats whole maps instead of last cmd in map
    init = function()
        require("leap").set_default_keymaps()
    end,
}