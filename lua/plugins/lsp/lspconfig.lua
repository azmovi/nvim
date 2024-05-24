return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
    },

    config = function()
        local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }

        local on_attach = function(_, bufnr)
            opts.buffer = bufnr
            opts.desc = "Show line diagnostics"
            keymap.set("n", "<A-l>", vim.diagnostic.open_float, opts)
            keymap.set("n", 'gd', vim.lsp.buf.definition , opts)
            keymap.set("n", 'gD', vim.lsp.buf.declaration, opts)
            keymap.set("n", 'gm', vim.lsp.buf.hover, opts)

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false,
                signs = true,
                update_in_insert = false,
                underline = true,
            }
            )

        end

        lspconfig["cssls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig["html"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = {"html", "jsp"}
        })


        lspconfig["jdtls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig["marksman"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig["pyright"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig["rust_analyzer"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

    lspconfig["lua_ls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
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
