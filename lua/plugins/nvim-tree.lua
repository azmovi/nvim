-- Nicer filetree than NetRW
return {
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				diagnostics = {
					enable = true,
				},
			})
		end,
	}
}

