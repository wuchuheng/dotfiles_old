local Module = {}
local helper = require('utils.helper')
local status, nvimAutopairs = helper.loadModule('nvim-autopairs')

-- Load config for autopairs
function Module.loadConfig()
    if not status then return end
    nvimAutopairs.setup()
end

return Module
