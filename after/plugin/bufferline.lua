local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
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
})

