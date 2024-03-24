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

    local from_vscode = require("luasnip.loaders.from_vscode")

    from_vscode.lazy_load()

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
          ["<CR>"] = cmp.mapping.confirm({ select = true}),

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
        --autocomplete = false,
        completeopt = "menu, menuone, popup",
      },
    })
  end,
}
