return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        local map = require("helpers.keys").map
        local builtin = require('telescope.builtin')
        map('n', '<leader>ff', builtin.find_files, {})
    end
}
