local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
    return 
end

configs.setup{
  ensure_installed = { "c", "lua", "vim", "python", "markdown", "cpp" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- the name of the parser)
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
