return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    cmp.setup({
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
          ["<C-X>"] = cmp.mapping.abort(), -- close completion window
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
          ["<CR>"] = cmp.mapping.confirm({ select = true}),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      preselect = 'item',
      completion = {
        autocomplete = false,
        completeopt = "menu, menuone, popup",
      },
    })
  end,
}
