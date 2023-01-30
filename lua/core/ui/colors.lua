local function set(scheme)
	local status, _ = pcall(vim.cmd, "colorscheme " .. scheme)
	if not status then
		vim.notify("colorscheme " .. scheme(" not found"))
		return
	end
	require("core.ui.themes." .. scheme)
end

set("monokai_pro")
