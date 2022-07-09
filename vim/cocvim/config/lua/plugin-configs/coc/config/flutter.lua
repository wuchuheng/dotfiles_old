local Module = {}
local autoCmd = require('autocmd')

function Module.loadConfig()
    local extensionsName = 'coc-flutter-tools'
    autoCmd.cocFlutter()
    return extensionsName
end

return Module
