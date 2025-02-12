-- Description:  Lf integration in vim and neovim.
-- Source: https://github.com/ptzz/lf.vim

return {
  {
    "ptzz/lf.vim",
    dependencies = { "voldikss/vim-floaterm" }, -- adds support for the floaterm of lf
    init = function()
      vim.g.lf_replace_netrw = true -- open lf when vim opens a directory
      vim.g.lf_map_keys = false
      vim.keymap.set("n", "-", ":LfCurrentFile<CR>")
    end,
  },
  {
    "voldikss/vim-floaterm",
    init = function()
      vim.g.floaterm_opener = "edit"
    end,
  },
}
