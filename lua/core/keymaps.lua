local map = require("helpers.keys").map

-- Roda codigo
map('n', '<leader>p', ':w | !python3 %<CR>')
map('n', '<leader>m', ':MarkdownPreview<CR>')
map('n', '<leader>c', ':w | !gcc % && ./a.out<CR>')
map('n', '<leader>t', ':w | !g++ % && ./a.out < *.txt <CR>')


-- nerd tree 
map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Basics
map('i', 'jk', '<ESC>')
map('n', '<leader>y', 'ggvG"+y')
map("n", "<leader>r", "<cmd>nohl<cr>", "Clear highlights")

-- Stay in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")
map('v', "J", ":m '>+1<CR>gv=gv")
map('v', "K", ":m '<-2<CR>gv=gv")

-- Movimentação de janelas
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')


--Check Spell
map('n', '<leader>d', ':lua ToggleSpellCheck()<CR>')
map('n', '<leader>w', 'z=')
map('i', '<leader>w', '<ESC> z=')
function ToggleSpellCheck()
    if vim.wo.spell then
        vim.wo.spell = false
        print('Spell check disabled')
    else
        vim.wo.spell = true
        print('Spell check enabled')
    end
end

