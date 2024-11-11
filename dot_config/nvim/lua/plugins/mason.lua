-- Description: Quickstart configs for Nvim LSP.
-- Source: https://github.com/williamboman/mason.nvim

return {
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
}