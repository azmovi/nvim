vim.g.UltiSnipsSnippetDirectories = {'/home/azevedo/.config/nvim/lua/plugins/snippets'}

vim.api.nvim_set_keymap('i', '<tab>', '<ESC>:UltiSnipsExpandTrigger<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<c-i>', '<ESC>:UltiSnipsJumpForwardTrigger<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<c-b>', ':UltiSnipsJumpBackwardTrigger<CR>', { noremap = true, silent = true })

return {
    "SirVer/ultisnips"
}

