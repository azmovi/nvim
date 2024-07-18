local map = require("helpers.keys").map

-- Roda codigo
map('n', '<leader>p', ':w | !python3 %<CR>')
map('n', '<leader>m', ':MarkdownPreview<CR>')
map('n', '<leader>c', ':w | !gcc % && ./a.out<CR>')
map('n', '<leader>t', ':w | !g++ % && ./a.out < *.txt <CR>')
-- map('n', '<leader>l', ':w | !pdflatex main.tex && firefox main.pdf <CR>')
map('n', '<leader>t', ':w | !./mvnw tomcat7:redeploy <CR>')
map('n', '<leader>r', ':w | !.rustc % && ./* <CR>')


-- nerd tree 
map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Basics
map('i', 'jk', '<ESC>')
map('n', '<leader>y', 'gg0vG$"+y')
map('v', '<leader>y', '"+y')
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

map("n", "<leader>h", ":lua LiveServerToggle()<CR>")
local running = false
function LiveServerToggle()
    if running then
        running = false
        vim.cmd('LiveServerStop')
    else
        running = true
        vim.cmd('LiveServerStart')
    end
end

map("n", "<leader>l", ":lua lspToggle()<CR>")
local flag = false
function lspToggle()
    if flag then
        flag = false
        vim.cmd('LspStop')
    else
        flag = true
        vim.cmd('LspStart')
    end
end
