-- Description: Nvim Treesitter configurations and abstraction layer.
-- Source: https://github.com/nvim-treesitter/nvim-treesitter

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        -- a list of parser names, or "all"
        ensure_installed = {
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "html",
            "css",
            "markdown",
            "markdown_inline",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "c",
            "cpp",
            "rust",
            "toml",
            "go",
            "zig",
        },
        -- install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- automatically install missing parsers when entering buffer
        auto_install = true,
        -- list of parsers to ignore installing (for "all")
        ignore_install = {},
        indent = { enable = true },
        autotag = { enable = true },
        highlight = {
            enable = true,
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
        -- rainbow = {
        --     enable = true,
        --     disable = { "html" },
        --     extended_mode = false,
        --     max_file_lines = nil,
        -- },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
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
}
