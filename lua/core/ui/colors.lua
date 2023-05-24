local colorscheme = "minimal"
local status = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end
