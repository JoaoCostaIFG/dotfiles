local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<Leader>q", ":Bdelete<CR>")
map("", "<F15>", ":set list!<CR>")

-- ctrl+s to save
map("", "<C-S>", ":update<CR>", { silent = true })
map("x", "<C-S>", "<C-C>:update<CR>", { silent = true })
map("i", "<C-S>", "<C-O>:update<CR>", { silent = true })

-- change buffer
map("n", "<C-l>", ":bnext<CR>")
map("n", "<C-h>", ":bprevious<CR>")

-- Repeat last macro
map("", ",", "@@")

-- Better long line movement
map("n", "j", "gj")
map("n", "k", "gk")

-- spell-check
map("", "<Leader>o", ":setlocal spell! spelllang=en_us<CR>")
map("", "<Leader>O", ":setlocal spell! spelllang=pt<CR>")

-- RIP-GREP
map("n", "_", ":Telescope live_grep<CR>")

-- Code navigation
map('n', 'gD', '<c-w>v<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gF', '<c-w>vgF')
