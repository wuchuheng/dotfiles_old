local keybindings = require "keybindings"
local Module = {}

-- Load config for expandRegion.
function Module.loadConfig()
    keybindings.expandRegion()
end

return Module
