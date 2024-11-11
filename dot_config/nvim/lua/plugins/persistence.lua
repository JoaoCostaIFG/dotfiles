-- Description: Simple session management for Neovim.
-- Source: https://github.com/folke/persistence.nvim
-- session management

return {
    "folke/persistence.nvim",
    config = function()
        local persistence = require("persistence")
        persistence.setup()
        -- restore the session for the current directory
        vim.keymap.set("n", "<leader>ss", persistence.load, { desc = "Load session for this directory" })
        -- restore the last session
        vim.keymap.set("n", "<leader>sl", function()
            persistence.load({ last = true })
        end, { desc = "Load last nvim session" })
    end,
}