-- Description:  A snazzy bufferline for Neovim.
-- Source: https://github.com/akinsho/bufferline.nvim

return {
    'akinsho/bufferline.nvim',-- version = "*",
    branch = "main",
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
}