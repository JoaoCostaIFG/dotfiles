-- Description: Comfortable & Pleasant Color Scheme for Vim.
-- Source: https://github.com/sainnhe/everforest

return {
	"sainnhe/everforest",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	init = function()
		vim.opt.background = "dark"
		vim.g.everforest_background = "hard"
		vim.g.everforest_enable_italic = true
		vim.g.everforest_transparent_background = true
		vim.g.everforest_diagnostic_line_highlight = true
	end,
	config = function()
		-- load the colorscheme here
		-- vim.cmd([[colorscheme everforest]])
	end,
}
