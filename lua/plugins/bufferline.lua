-- Veja os buffers atuais no topo do editor
return {
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup{
                options = {
                    numbers = "none",
                    separator_style =  'thin',
                    diagnostics = "nvim_lsp",
                }
            }
			local map = require("helpers.keys").map
			map("n", "<Tab>", ":BufferLineCycleNext<CR>")
			map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
        end,

    }
}

