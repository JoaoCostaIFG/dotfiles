-- Description: markdown preview plugin for (neo)vim.
-- Source: https://github.com/iamcco/markdown-preview.nvim

return {
    "iamcco/markdown-preview.nvim",
    -- ft = { "markdown" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/markdown.css"
        vim.g.mkdp_port = "8542"
    end,
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    lazy = true,
}
