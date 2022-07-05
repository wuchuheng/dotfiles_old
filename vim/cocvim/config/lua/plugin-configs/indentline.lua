local Module = {}

function Module.loadConfig()
  vim.cmd([[
        let g:indentLine_char_list = ['|', '¦', '┆', '┊']
  ]])
  
end

return Module
