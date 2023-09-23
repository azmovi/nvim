return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            local map = require("helpers.keys").map
            map('i', '<A-d>', ':lua vim.lsp.buf.hover()<CR>')
            map('n', '<A-d>', ':lua vim.lsp.buf.hover()<CR>')
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                }),
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                    autocomplete = false,
                },
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                },
                make_pyright_config = function()
                    local config = mason_lspconfig.make_config()
                    config.settings = {
                        python = {
                            analysis = {
                                autoImportCompletion = true,
                                autoSearchPaths = true,
                                diagnosticMode = "openFilesOnly",
                                typeCheckingMode = "off",
                                useLibraryCodeForTypes = true,
                            },
                        },
                    }

                    local function venv_path()
                        if vim.fn.isdirectory(".venv") == 1 then
                            return vim.fn.getcwd() .. "/.venv"
                        end

                        if vim.fn.filereadable("pyproject.toml") == 1 then
                            local poetry = vim.fn.system("poetry env info -p"):gsub("\n", "")
                            if vim.fn.isdirectory(poetry) then
                                return poetry
                            end
                        end
                    end

                    local venv = venv_path()
                    if venv == nil then
                        return config
                    end

                    local packages = vim.fn.system(venv .. "/bin/python -m pip --list")
                    if string.find(packages, "mypy") ~= nil then
                        config.settings.python.analysis.typeCheckingMode = "basic"
                    end

                    config.settings.python.pythonPath = venv .. "/bin/python"
                    return config
                end
            })
        end,
    }
}
