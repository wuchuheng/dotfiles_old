local Debug = require('utils.debug')
local Table = require('utils.table')
local String = require('utils.string')
local Path = require('utils.path')

local helper = {}

-- Load modules
-- @modules = {}
-- @unloadModules = {}
-- @modulePrefix = ""
function helper.loadModules(modulePath, unloadModules, modulePrefix)
  modulePrefix = modulePrefix or ""
  unloadModules = unloadModules or {}
  local files = {}

  for dir in io.popen('ls ' .. modulePath):lines() do
    table.insert(files, dir)
  end
  Table:getInstance(files)
  -- 格式化模块名
  :map(function(_, v) 
    local res = String:getInstance(v):split('.')
    if (#res > 1 and res[#res] == 'lua') then 
      table.remove(res)
    end
    return table.concat(res, '.') 
  end)
  -- 过虑掉不指定加载的模块
  :filter(function(_, v) 
    if Table:getInstance(unloadModules):hasValue(v) then
      return false
    else
      return true
    end
  end)
  -- 加载模块
  :foreach(function(_, v)
    if (#modulePrefix ~= 0 and modulePrefix[-1] ~= '.') then
      modulePrefix = modulePrefix .. '.'
    end
    local moduleName = modulePrefix .. v
    local status, _ = pcall(require, moduleName)
    if not status then
      vim.notify("Not found " .. moduleName)
    end
  end)

end


return helper
