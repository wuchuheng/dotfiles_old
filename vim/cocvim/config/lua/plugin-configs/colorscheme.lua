local Module = {}

-- Loading the config for plugin.
function Module.loadConfig()
  local colorscheme = 'tokyonight'
  local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
  if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
    return
  end
end

return Module
