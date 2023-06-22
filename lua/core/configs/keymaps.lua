local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = ','

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>p', ':w | !python3 %<CR>', opts)
map('n', '<leader>m', ':MarkdownPreview<CR>', opts)
map('n', '<leader>c', ':w | !gcc % && ./a.out<CR>', opts)
map('n', '<leader>d', ':lua ToggleSpellCheck()<CR>', opts)
map('n', '<leader>w', 'z=', opts)
map('i', '<leader>w', '<ESC> z=', opts)
map('i', 'jk', '<ESC>', opts)
-- Movimentação de janelas
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-j>', '<C-w>j', opts)

-- Movimentação de buffers
map('n', '<tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<leader><tab>', ':BufferLineCyclePrev<CR>', opts)


--Check Spell
function ToggleSpellCheck()
    if vim.wo.spell then
        vim.wo.spell = false
        print('Spell check disabled')
    else
        vim.wo.spell = true
        print('Spell check enabled')
    end
end

