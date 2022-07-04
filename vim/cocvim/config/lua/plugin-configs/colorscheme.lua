local Module = {
  colorscheme = 'tokyonight'
}

-- Loading the config for plugin.
function Module.loadConfig()
  local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. Module.colorscheme)
  if not status_ok then
    vim.notify("colorscheme " .. Module.colorscheme .. " 没有找到！")
    return
  end
end


return Module
