-- Show search result count on lualine bar

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, {
      function()
        return require("noice").api.status.search.get()
      end,
      cond = function()
        return package.loaded["noice"] and require("noice").api.status.search.has()
      end,
    })
  end,
}
