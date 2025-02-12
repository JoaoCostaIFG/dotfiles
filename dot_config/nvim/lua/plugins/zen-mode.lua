-- Description: Distraction-free coding for Neovim.
-- Source: https://github.com/folke/zen-mode.nvim
-- the writing focus thing

return {
  "folke/zen-mode.nvim",
  init = function()
    vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>")
  end,
  cmd = { "ZenMode" },
  lazy = true,
}
