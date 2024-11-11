-- Description: Quickstart configs for Nvim LSP.
-- Source: https://github.com/neovim/nvim-lspconfig

return {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "mason-lspconfig.nvim" },
    init = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup_handlers {
            -- default handler is called for each installed server that doesn't have
            -- a dedicated handler (first entry)
            function (server_name)
                require("lspconfig")[server_name].setup({ capabilities = capabilities })
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            -- ["rust_analyzer"] = function ()
            --     require("rust-tools").setup {}
            -- end
        }

        -- lspconfig.clangd.setup({ capabilities = capabilities })
        -- lspconfig.pyright.setup({ capabilities = capabilities })
        -- lspconfig.ts_ls.setup({ capabilities = capabilities })
        -- lspconfig.marksman.setup({ capabilities = capabilities })
    end,
    cmd = { "LspInfo", "LspStart", "LspStop", "LspRestart" },
}
