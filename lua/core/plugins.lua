local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)

-- Install your plugins here

require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    "wbthomason/packer.nvim"
    "tanvirtin/monokai.nvim"
    "nvim-tree/nvim-tree.lua"
    "nvim-tree/nvim-web-devicons"
    "nvim-lualine/lualine.nvim"
    "jiangmiao/auto-pairs"
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    "ervandew/supertab"
    "yazeed1s/minimal.nvim")
    "iamcco/markdown-preview.nvim"
    "akinsho/bufferline.nvim", tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
})
