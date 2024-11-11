-- Description: A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
-- Source: https://github.com/folke/trouble.nvim

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("trouble").setup()

        local actions = require("telescope.actions")
        local trouble = require("trouble.sources.telescope")

        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                mappings = {
                    i = { ["<c-t>"] = trouble.open },
                    n = { ["<c-t>"] = trouble.open },
                },
            },
        })
    end,
}