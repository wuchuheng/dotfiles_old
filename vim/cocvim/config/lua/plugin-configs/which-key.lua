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

-- Get Gegister By prefix
function Module.getRegisterByPrefix (prefixConfig)
  local nameList = {}
  local name = prefixConfig.name or ''
  local prefix = prefixConfig.prefix
    if (type(name) == 'string' and #name ~= 0) then
      nameList[name] = true
      table.concat(nameList, name)
    end
  return function(config)
    if (type(config.name) == 'string' and config.name ~= '') then
      nameList[config.name] = true
    end
    local name = ''
    for key, _ in pairs(nameList) do
      local symbol = ''
      if name ~= '' then symbol = '|' end
      name = string.format('%s%s%s', name, symbol, key)
    end
    if name ~= '' then
      config.name = name
    end

    return Module.register(config, {prefix = prefix})
  end
end

return Module
