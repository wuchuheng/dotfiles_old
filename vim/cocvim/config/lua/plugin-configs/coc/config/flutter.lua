local Module = {}
local autoCmd = require('autocmd')

function Module.loadConfig()
    local extensionsName = 'coc-flutter'
    autoCmd.cocFlutter()
    return extensionsName
end

return Module
