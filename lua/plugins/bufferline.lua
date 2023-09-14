-- See current buffers at the top of the editor
return {
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			numbers = "raise",
			separator_style = "thin",
			offsets = {
			    {
				filetype = "neo-tree",
				text = "Arquivos",
				text_align = "center",
				separator = true,
			    },
			    {
				filetype = "NvimTree",
				text = "Arquivos",
				text_align = "center",
				separator = true,
			    },
			},
		},
	},
}

