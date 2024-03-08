return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {"hrsh7th/cmp-nvim-lsp",},

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

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false,
                signs = true,
                update_in_insert = false,
                underline = true,
            }
            )

        end
        local venv_path = os.getenv('VIRTUAL_ENV')
        local py_path = nil
        -- decide which python executable to use for mypy
        if venv_path ~= nil then
            py_path = venv_path .. "/bin/python3"
        else
            py_path = vim.g.python3_host_prog
        end

        lspconfig.pylsp.setup {
            on_attach = on_attach,
            settings = {
                pylsp = {
                    plugins = {
                        -- formatter options
                        blue = { enabled = true },
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },
                        -- linter options
                        pylint = { enabled = true,
                            executable = "pylint",
                            pythonPath = ".env/bin/python",
                            pylintPath = ".env/bin/pylint",
                            ignore = {"E0401"}
                        },
                        ruff = { enabled = true },
                        pyflakes = { enabled = false },
                        pycodestyle = { enabled = false },
                        -- type checker
                        pylsp_mypy = {
                            enabled = true,
                            overrides = { "--python-executable", py_path, true },
                            report_progress = true,
                            live_mode = false
                        },
                        -- auto-completion options
                        jedi_completion = { fuzzy = true },
                        -- import sorting
                        isort = { enabled = true },
                    },
                },
            },
            flags = {
                debounce_text_changes = 200,
            },
            capabilities = capabilities,
        }

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
