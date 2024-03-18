return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local default_cmp_sources ={
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }

      local mappings = {
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<C-x>'] = cmp.mapping.abort(),
            ['<C-p>'] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = 'insert' })
                else
                    cmp.complete()
                end
            end),
            ['<C-n>'] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = 'insert' })
                else
                    cmp.complete()
                end
            end),
        }
                local opts = {
            completion = {
                completeopt = 'menu,menuone',
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = {
                    scrollbar = false,
                    border = "rounded",
                },
                documentation = {
                    border = "rounded",
                },
            },
            sources = default_cmp_sources,
            mapping = mappings,
        }

        cmp.setup(opts)
  end,
}
