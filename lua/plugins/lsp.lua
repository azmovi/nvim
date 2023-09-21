return {
    {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup {}
        end
    },

    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup{
                ensure_installed = {"lua_ls", "clangd", "marksman", "jedi_language_server"}
            }
            require("lspconfig").lua_ls.setup {}
            require("lspconfig").clangd.setup {}
            require("lspconfig").marksman.setup {}
            require("lspconfig").jedi_language_server.setup {}
        end
    },

    {
        'neovim/nvim-lspconfig'
    }
}
