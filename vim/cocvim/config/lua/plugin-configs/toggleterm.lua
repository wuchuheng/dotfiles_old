local keybindings = require "keybindings"
local Module = {}

-- Load config for toggleterm
function Module.loadConfig()
   keybindings.toggleterm()
end

return Module
