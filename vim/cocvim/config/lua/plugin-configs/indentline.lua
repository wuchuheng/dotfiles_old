local Module = {}
local autoCmd = require('autocmd')

function Module.loadConfig()
    vim.cmd([[ let g:indentLine_char_list = ['|', '¦', '┆', '┊'] ]])
    autoCmd.identLine()
end

return Module
