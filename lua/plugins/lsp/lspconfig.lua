return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }

    local on_attach = function(_, bufnr)
      opts.buffer = bufnr
      opts.desc = "Show line diagnostics"
      keymap.set("n", "<A-l>", vim.diagnostic.open_float, opts)

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = false,
        underline = true,
        -- show signs
        signs = true,
        -- delay update diagnostics
        update_in_insert = false,
      }
    )


    end

    lspconfig["pyright"].setup({
      on_attach = on_attach,
    })

    lspconfig["lua_ls"].setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}