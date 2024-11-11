-- Description: Neovim plugin to manage the file system and other tree like structures.
-- Source: https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    init = function()
        vim.keymap.set("n", "<Leader>f", ":Neotree<CR>")
    end,
    cmd = { "Neotree" },
}