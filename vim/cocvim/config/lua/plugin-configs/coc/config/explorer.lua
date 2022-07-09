local keybindings = require('keybindings')
local Module = {}

function Module.loadConfig()
    
    -- welcome to here
    keybindings.cocExplorer()
    return 'coc-explorer'
    
end

return Module
