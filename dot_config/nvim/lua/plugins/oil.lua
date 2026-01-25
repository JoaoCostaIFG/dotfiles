-- Description: Neovim file explorer: edit your filesystem like a buffer
-- Source: https://github.com/stevearc/oil.nvim

return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
