local Module = {}
local helper = require('utils.helper')
local status, aerial = helper.loadModule('aerial')
local keybindings = require('keybindings')

function Module.loadConfig()
    if not status then return end
    aerial.setup({
        on_attach = keybindings.outline
    })
end

return Module
