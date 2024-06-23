return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        --local load_snipmate = require("luasnip.loaders.from_snipmate").lazy_load
        local luasnip = require("luasnip")
        local vscode = require('luasnip.loaders.from_vscode').lazy_load

        luasnip.filetype_extend("jsp", {"html"})
        luasnip.filetype_extend("vue", {"html"})
        -- Carregar os snippets do SnipMate
        --load_snipmate({ paths = "~/.config/nvim/snippets" })

        -- Mapeamento para expansão de snippets
        --local map = require("helpers.keys").map
        --map("i", "A-<TAB>", "<cmd>lua require'luasnip'.expand_or_jump()<CR>")

        --map("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>")
    end
}

