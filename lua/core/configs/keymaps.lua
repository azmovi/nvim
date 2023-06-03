local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.g.mapleader = ','

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>p', ':w | !python3 %<CR>', opts)
map('n', '<leader>m', ':MarkdownPreview <CR>', opts)
map('n', '<leader>c', ':w | !gcc % && ./a.out <CR>', opts)
map('i', 'jk', '<ESC>', opts)
