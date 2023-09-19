local map = require("helpers.keys").map

map('n', '<leader>e', ':NvimTreeToggle<CR>')
map('n', '<leader>p', ':w | !python3 %<CR>')
map('n', '<leader>m', ':MarkdownPreview<CR>')
map('n', '<leader>c', ':w | !gcc % && ./a.out<CR>')
map('n', '<leader>d', ':lua ToggleSpellCheck()<CR>')
map('n', '<leader>w', 'z=')
map('n', '<leader>q', ':bd<CR>')
map('i', '<leader>w', '<ESC> z=')
map('i', 'jk', '<ESC>')

map('n', '<leader>t', ':w | !g++ % && ./a.out < *.txt <CR>')
-- Movimentação de janelas
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')

-- Movimentação de buffers
map('n', '<tab>', ':BufferLineCycleNext<CR>')
map('n', '<leader><tab>', ':BufferLineCyclePrev<CR>')

map('n', '<leader>y', 'ggvG"+y')
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

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

