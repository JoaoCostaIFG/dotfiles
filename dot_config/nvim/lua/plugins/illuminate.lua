-- Description: (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
-- Source: https://github.com/RRethy/vim-illuminate

return {
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
}