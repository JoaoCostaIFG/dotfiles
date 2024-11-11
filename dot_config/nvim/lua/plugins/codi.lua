-- Description: The interactive scratchpad for hackers.
-- Source: https://github.com/metakirby5/codi.vim
-- hacker scratchpad

return {
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
}