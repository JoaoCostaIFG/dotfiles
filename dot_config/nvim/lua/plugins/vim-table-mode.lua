-- Description: VIM Table Mode for instant table creation.
-- Source: https://github.com/dhruvasagar/vim-table-mode

return {
  "dhruvasagar/vim-table-mode",
  init = function()
    -- make it more equivalent to the markdown one
    vim.g.table_mode_header_fillchar = "-"
  end,
  cmd = { "TableModeEnable", "TableModeDisable", "TableModeToggle", "TableModeRealign" },
  lazy = true,
}
