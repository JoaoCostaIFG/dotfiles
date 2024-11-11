-- Description: null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
-- Source: https://github.com/nvimtools/none-ls.nvim

return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local null_ls = require("null-ls")
		return {
			sources = {
				null_ls.builtins.diagnostics.codespell,
				null_ls.builtins.diagnostics.fish,
			},
		}
	end,
}
