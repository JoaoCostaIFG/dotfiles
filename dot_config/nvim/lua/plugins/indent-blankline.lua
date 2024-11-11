-- Description: Indent guides for Neovim.
-- Source: https://github.com/lukas-reineke/indent-blankline.nvim
-- indent guides

return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({})
        -- can use "│" and "▏"
        --char = "▏",
        --space_char_blankline = " ",
        --buftype_exclude = { "terminal" },

        vim.keymap.set("", "<F3>", ":IndentBlanklineToggle<CR>", { desc = "Toggle indent guides", silent = true })
    end,
}