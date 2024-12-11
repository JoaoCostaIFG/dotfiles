-- Description: Highly customisable markdown(latex & inline html) previewer for Neovim
-- Source: https://github.com/OXY2DEV/markview.nvim

return {
	"OXY2DEV/markview.nvim",
	lazy = false, -- Recommended
	-- ft = "markdown" -- If you decide to lazy-load anyway

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
