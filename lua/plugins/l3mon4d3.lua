return
{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
}
