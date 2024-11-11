-- Description: Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
-- Source: https://github.com/williamboman/mason-lspconfig.nvim

return {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        automatic_installation = true,
        ensure_installed = {
            "ruff",
            "ts_ls",
            "clangd",
            "marksman",
        },
    },
    event = "User FileOpened",
    cmd = { "LspInstall", "LspUninstall" },
}
