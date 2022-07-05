local helper = require('utils.helper')
local Module = {}

-- Loading the config for this plugin
function Module.loadConfig()

end

-- The key maping register.
function Module.register(...)
 local status,  whichKey =  helper.loadModule('which-key')
  if not status then
    return 
  end

  return whichKey.register(...)
end

return Module
