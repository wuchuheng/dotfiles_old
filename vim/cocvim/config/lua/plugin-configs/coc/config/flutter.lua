local Module = {}
local autoCmd = require('autocmd')
local keybindings = require('keybindings')

function Module.loadConfig()
    autoCmd.cocFlutter()
    keybindings.flutter()
    return 'coc-flutter-tools'
end

return Module
