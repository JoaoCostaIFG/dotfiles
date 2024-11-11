-- Description: paste image to markdown.
-- Source: https://github.com/ferrine/md-img-paste.vim

return {
    "ferrine/md-img-paste.vim",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function(args)
                vim.keymap.set("n", "<Leader>p", ":call mdip#MarkdownClipboardImage()<CR>")
            end,
        })
    end,
}