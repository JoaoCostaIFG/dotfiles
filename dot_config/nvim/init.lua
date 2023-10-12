if vim.opt.shell:get():sub(-#"fish") == "fish" then
	vim.opt.shell = "/bin/bash"
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct
if vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end

require("lazy").setup({
	------------------------------------------------------------------------------------------------
	--                                 BASICS/DEFAULT-ISH THINGS                                  --
	------------------------------------------------------------------------------------------------
	{ "tpope/vim-sensible" },
	{ "moll/vim-bbye" },
	{ "stevearc/dressing.nvim", event = "VeryLazy" }, -- " cute prompt windows
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
			if vim.fn.has("termguicolors") then
				vim.notify.setup({ background_colour = "#000000" })
			else
				vim.notify.setup()
			end
		end,
		lazy = true,
	}, -- cute notifications
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" }, -- repeats whole maps instead of last cmd in map
		init = function()
			require("leap").set_default_keymaps()
		end,
	}, -- general-purpose motion plugin
	{ "nacro90/numb.nvim", opts = {} }, -- peak in :<number> line commands
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.opt.timeout = true
			vim.opt.timeoutlen = 500
		end,
		opts = {},
	},
	{ "Tastyep/structlog.nvim", lazy = true }, -- structured logs
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("alpha.themes.startify").config
		end,
	}, -- greeter

	-----------------------------------------------------------------------------------------------
	--                                          THEMING                                          --
	-----------------------------------------------------------------------------------------------
	{
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
			vim.cmd([[colorscheme everforest]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			icons_enabled = true,
			theme = "everforest",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			tabline = {},
		},
	},
	{
		'akinsho/bufferline.nvim', version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			local bufferline = require('bufferline')
			bufferline.setup({
				options = {
					mode = "buffers",
					middle_mouse_command = "bdelete! %d",
					separator_style = {""},
					indicator = {
						icon = '',
						style = 'underline',
					},
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					offsets = {
						{
							filetype = "neo-tree",
							text = "NeoTree",
							text_align = "left",
							separator = true,
						}
					},
					-- separator_style = "slant",
					always_show_bufferline = true,
					hover = {
							enabled = true,
							delay = 200,
							reveal = {'close'}
					},
				},
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "javascript", "typescript", "html" },
		opts = {
			"css",
			"javascript",
			"typescript",
			html = {
				mode = "foreground",
			},
		},
		init = function()
			require("colorizer").setup()
		end,
		lazy = true,
	}, -- colors become colored
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},

	------------------------------------------------------------------------------------------------
	--                                          WRITING                                           --
	------------------------------------------------------------------------------------------------
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/markdown.css"
			vim.g.mkdp_port = "8542"
		end,
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
		lazy = true,
	},
	{
		"ferrine/md-img-paste.vim",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(args)
					vim.keymap.set("n", "<Leader>p", ":call mdip#MarkdownClipboardImage()<CR>")
				end,
			})
		end,
	},
	{
		"dhruvasagar/vim-table-mode",
		init = function()
			-- make it more equivalent to the markdown one
			vim.g.table_mode_header_fillchar = "-"
		end,
	},
	{
		"junegunn/vim-easy-align",
		keys = { "ga", { "ga", mode = "x" } },
		init = function()
			vim.keymap.set("n", "ga", ":EasyAlign<CR>")
			vim.keymap.set("x", "ga", ":EasyAlign<CR>")
		end,
	},
	{
		"folke/zen-mode.nvim",
		init = function()
			vim.keymap.set("n", "<Leader>n", ":ZenMode<CR>")
		end,
	}, -- the writting focus thing
	{
		"folke/twilight.nvim",
		init = function()
			vim.keymap.set("n", "<Leader>m", ":Twilight<CR>")
		end,
		opts = {
			on_open = function(_)
				vim.cmd("cabbrev <buffer> q let b:quitting = 1 <bar> q")
				vim.cmd("cabbrev <buffer> wq let b:quitting = 1 <bar> wq")
			end,
			on_close = function()
				if vim.b.quitting == 1 then
					vim.b.quitting = 0
					vim.cmd("q")
				end
			end,
		},
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
	}, -- the thing that dims colors in for zen-mode

	------------------------------------------------------------------------------------------------
	--                                           TOOLS                                            --
	------------------------------------------------------------------------------------------------
	{
		"ptzz/lf.vim",
		dependencies = { "voldikss/vim-floaterm" }, -- adds support for the floaterm of lf
		init = function()
			vim.g.lf_replace_netrw = true -- open lf when vim opens a directory
			vim.g.lf_map_keys = false
			vim.keymap.set("n", "-", ":LfWorkingDirectory<CR>")
		end,
	},
	{
		"voldikss/vim-floaterm",
		init = function()
			vim.g.floaterm_opener = "edit"
		end,
	},
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install()"]()
		end,
	},
	{ "junegunn/fzf.vim" },
	{
		"monaqa/dial.nvim",
		keys = { "<C-a>", "<C-x>" },
		init = function()
			local augend = require("dial.augend")
			local map = require("dial.map")
			vim.keymap.set("n", "<C-a>", map.inc_normal(), { noremap = true })
			vim.keymap.set("n", "<C-x>", map.dec_normal(), { noremap = true })
			vim.keymap.set("n", "g<C-a>", map.inc_gnormal(), { noremap = true })
			vim.keymap.set("n", "g<C-x>", map.dec_gnormal(), { noremap = true })
			vim.keymap.set("v", "<C-a>", map.inc_visual(), { noremap = true })
			vim.keymap.set("v", "<C-x>", map.dec_visual(), { noremap = true })
			vim.keymap.set("v", "g<C-a>", map.inc_gvisual(), { noremap = true })
			vim.keymap.set("v", "g<C-x>", map.dec_gvisual(), { noremap = true })
		end,
	},
	{
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
	}, -- session management
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = true,
		branch = "v3.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		init = function()
			vim.keymap.set("n", "<Leader>f", ":Neotree<CR>")
		end,
		cmd = { "Neotree" },
	},

	------------------------------------------------------------------------------------------------
	--                                            lsp                                             --
	------------------------------------------------------------------------------------------------
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		dependencies = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
		init = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
		end,
		cmd = { "LspInfo", "LspStart", "LspStop", "LspRestart" },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		dependencies = "mason.nvim",
		opts = {
			automatic_installation = true,
			ensure_installed = {
				"pyright",
			},
		},
		event = "User FileOpened",
		cmd = { "LspInstall", "LspUninstall" },
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		build = function()
			pcall(function()
				require("mason-registry").refresh()
			end)
		end,
		opts = {
			pip = {
				upgrade_pip = true,
			},
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		event = "User FileOpened",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
	},
	{
		"tamago324/nlsp-settings.nvim",
		lazy = true,
		cmd = "LspSettings",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"cmp-nvim-lsp",
			"cmp_luasnip",
			"cmp-buffer",
			"cmp-path",
			"cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
	{ "hrsh7th/cmp-buffer", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
	{ "hrsh7th/cmp-cmdline", lazy = true },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_lua").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = paths,
			})
			require("luasnip.loaders.from_snipmate").lazy_load()
		end,
		event = "InsertEnter",
	},
	{ "rafamadriz/friendly-snippets", lazy = true },
	{
		"mfussenegger/nvim-lint",
		lazy = true,
		init = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				sh = { "shellcheck" },
			}
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"mhartington/formatter.nvim",
		lazy = true,
		init = function()
			vim.keymap.set("", "<F1>", ":Format<CR>", { desc = "Format the file", silent = true })
		end,
		config = function()
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					-- TODO "--prose-wrap", "always",
					c = { require("formatter.filetypes.c").clangformat },
					cpp = { require("formatter.filetypes.cpp").clangformat },
					cs = { require("formatter.filetypes.cs").clangformat },
					css = { require("formatter.filetypes.css").prettier },
					html = { require("formatter.filetypes.html").prettier },
					javascript = { require("formatter.filetypes.javascript").prettier },
					typescript = { require("formatter.filetypes.typescript").prettier },
					json = { require("formatter.filetypes.json").prettier },
					markdown = { require("formatter.filetypes.markdown").prettier },
					sh = { require("formatter.filetypes.sh").shfmt },
					python = { require("formatter.filetypes.python").black },
					lua = { require("formatter.filetypes.lua").stylua },

					-- Use "*" filetype for formatter configurations on any filetype
					["*"] = {
						-- "formatter.filetypes.any" defines default configurations for any filetype
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
		end,
		cmd = { "Format", "FormatWrite" },
	},
	{ "folke/neodev.nvim", lazy = true }, -- neovim lua api autocomplete

	------------------------------------------------------------------------------------------------
	--                                        programming                                         --
	------------------------------------------------------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			-- a list of parser names, or "all"
			ensure_installed = { "c", "lua", "python" },
			-- install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			-- automatically install missing parsers when entering buffer
			auto_install = true,
			-- list of parsers to ignore installing (for "all")
			ignore_install = {},
			highlight = {
				enable = true,
				disable = {},
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		},
		cmd = {
			"TSInstall",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSInstallInfo",
			"TSInstallSync",
			"TSInstallFromGrammar",
		},
	},
	{ "sheerun/vim-polyglot" }, -- all langs syntax highlight
	{ "kristijanhusak/vim-carbon-now-sh" }, -- export code snippets
	{
		"windwp/nvim-autopairs",
		opts = {
			map_c_w = true,
		},
	}, -- pairs
	{
		"numToStr/Comment.nvim",
		opts = {},
	}, -- comments
	{ "tpope/vim-surround" }, -- work with delimiters
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				-- can use "│" and "▏"
				char = "▏",
				space_char_blankline = " ",
				buftype_exclude = { "terminal" },
			})

			vim.keymap.set("", "<F3>", ":IndentBlanklineToggle<CR>", { desc = "Toggle indent guides", silent = true })
		end,
	}, -- indent guides
	{ "tpope/vim-fugitive" }, -- git plugin
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<S-Tab>",
				},
			},
			filetypes = {
				markdown = true,
			},
		},
	},
	{ "sindrets/diffview.nvim" }, -- better diff view
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterOrange",
					"RainbowDelimiterCyan",
					"RainbowDelimiterRed",
				},
			}
		end,
	}, -- rainbow parentheses
	{
		"metakirby5/codi.vim",
		lazy = true,
		init = function()
			-- vim.keymap.set("", "<F4>", ":Codi!!<CR>", {desc = "Open Codi", silent = true})
			vim.cmd([[
        let g:codi#interpreters = {
          \ 'python': {
            \ 'bin': 'python',
            \ 'prompt': '^\(>>>\|\.\.\.\) ',
            \ 'quitcmd': "import readline; readline.clear_history(); exit()",
          \ },
        \ }
      ]])
		end,
		cmd = { "Codi", "CodiNew", "CodiExpand", "CodiSelect", "CodiUpdate" },
	}, -- hacker scratchpad
	{
		"RRethy/vim-illuminate",
		opts = {
			-- providers: provider used to get references in the buffer, ordered by priority
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 100, -- ms
			under_cursor = true,
			-- min_count_to_highlight: minimum number of matches required to perform highlighting
			min_count_to_highlight = 2,
		},
		event = "User FileOpened",
	},

	-----------------------------------------------------------------------------------------------
	--                                         telescope                                         --
	-----------------------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("trouble").setup()

			local actions = require("telescope.actions")
			local trouble = require("trouble.providers.telescope")

			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					mappings = {
						i = { ["<c-t>"] = trouble.open_with_trouble },
						n = { ["<c-t>"] = trouble.open_with_trouble },
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
	},
	{ "folke/todo-comments.nvim" },
})

---------------------------------------------
--      ___    ___    ____   ___  _____  ____ --
--    / __ ) /   |  / ___/ /  _// ____// ___/ --
--   / __  |/ /| |  \__ \  / / / /     \__ \  --
--  / /_/ // ___ | ___/ /_/ / / /___  ___/ /  --
-- /_____//_/  |_|/____//___/ \____/ /____/   --
--                                            --
---------------------------------------------
-- auto reload config on VIMRC save (not supported by Lazy)
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = {"init.vim", "init.lua", ".vimrc", "_vimrc"},
--   command = "source $MYVIMRC",
-- })
vim.keymap.set("n", "<Leader>q", ":Bdelete<CR>")

vim.opt.compatible = false
vim.cmd([[filetype plugin on]])

vim.opt.listchars:append({ lead = "⋅" })
vim.keymap.set("", "<F15>", ":set list!<CR>", { silent = true })
vim.opt.ts = 2
vim.opt.sts = 2
vim.opt.sw = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"
vim.opt.mousemoveevent = true
vim.opt.scrolloff = 5
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess = "a"
vim.opt.signcolumn = "yes" -- always show sign column (no shift when diagnostics run)
vim.opt.encoding = "utf-8"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard:append("unnamedplus")

-- ctrl+s to save
vim.keymap.set("", "<C-S>", ":update<CR>", { silent = true })
vim.keymap.set("x", "<C-S>", "<C-C>:update<CR>", { silent = true })
vim.keymap.set("i", "<C-S>", "<C-O>:update<CR>", { silent = true })

-- change buffer
vim.keymap.set("n", "<C-l>", ":bnext<CR>")
vim.keymap.set("n", "<C-h>", ":bprevious<CR>")

-- backup stuff
vim.cmd([[
set backupcopy=yes
if exists('$SUDO_USER')
  " don't create root owned files
  set nobackup
  set nowritebackup
  set noswapfile
  set noundofile
else
  " protect against crash-during-write
  set writebackup
  " but do not persist backup after successful write
  set nobackup

  set swapfile
  set directory^=~/.local/share/nvim/swap//

  " persist the undo tree for each file
  set undofile
  set undodir^=~/.local/share/nvim/undo//
endif
]])

vim.opt.hidden = true
-- Repeat last macro
vim.keymap.set("", ",", "@@")
-- Better long line movement
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
-- Save File and Exits
vim.api.nvim_create_user_command("E", "e", { desc = "Edit file (same as e)" })
vim.api.nvim_create_user_command("WQ", "wq", { desc = "Save and quit (same as wq)" })
vim.api.nvim_create_user_command("Wq", "wq", { desc = "Save and quit (same as wq)" })
vim.api.nvim_create_user_command("W", "w", { desc = "Save (same as w)" })
vim.api.nvim_create_user_command("Q", "q", { desc = "Quit (same as q)" })

---------------------------------------------------
--  _        _  ___    ___  _____  ___  _   _  _____ --
-- | |     / // __ \ /  _//_  __//  _// | / // ____/ --
-- | | /| / // /_/ / / /   / /   / / /  |/ // /___   --
-- | |/ |/ // _, _/_/ /   / /  _/ / / /|  // /_  /   --
-- |__/|__//_/ |_|/___/  /_/  /___//_/ |_/ \____/    --
--                                                   --
---------------------------------------------------
-- spell-check
vim.keymap.set("", "<Leader>o", ":setlocal spell! spelllang=en_us<CR>")
vim.keymap.set("", "<Leader>O", ":setlocal spell! spelllang=pt<CR>")

------------------------------------
--    _____  ___    ___    _     ____ --
--  /_  __//  _ \ /  _ \ / /   / ___/ --
--   / /  / / / // / / // /    \__ \  --
--  / /  / /_/ // /_/ // /___  __/ /  --
-- /_/   \____/ \____//_____//____/   --
--                                    --
------------------------------------
-- RIP-GREP
vim.keymap.set("n", "_", ":Rg<CR>")

--------------------------------
--     __  ___ ____ _____  ______ --
--    /  |/  //  _// ___/ / ____/ --
--   / /|_/ / / /  \__ \ / /      --
--  / /  / /_/ /  ___/ // /___    --
-- /_/  /_//___/ /____/ \____/    --
--                                --
--------------------------------
-- substitute all non-ascii chars by a space
function RM_non_ascii()
	vim.cmd("%s/[^[:alnum:][:punct:][:space:]]/ /g")
end
-- SAVE STATE/POS OF CURSOR -> execute cmd -> restore cursor
-- source: http://vimcasts.org/episodes/tidying-whitespace
vim.cmd([[
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
]])
-- FORMATING
-- strip white spaces
vim.api.nvim_create_user_command(
	"StripTrailWhiteChars",
	'call Preserve("%s/\\s\\+$//e")',
	{ desc = "Strip white space in file" }
)
-- simple format (variatic because of ALE)
vim.cmd([[
function! SimpFormat(...)
  call Preserve("retab")
  call Preserve("%s/\\s\\+$//e")
  call Preserve("normal gg=G")
endfunction
]])
-- vim -b : edit binary using xxd-format! (see :h hex-editing)
vim.cmd([[
augroup Binary
  au!
  au BufReadPre  *.bin,*.exe let &bin=1
  au BufReadPost *.bin,*.exe if &bin | %!xxd
  au BufReadPost *.bin,*.exe set ft=xxd | endif
  au BufWritePre *.bin,*.exe if &bin | %!xxd -r
  au BufWritePre *.bin,*.exe endif
  au BufWritePost *.bin,*.exe if &bin | %!xxd
  au BufWritePost *.bin,*.exe set nomod | endif
augroup END
]])
