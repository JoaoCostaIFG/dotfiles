-- Description: A formatter for neovim.
-- Source: https://github.com/mhartington/formatter.nvim

return {
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
}