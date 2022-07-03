local String = require('utils.string')
Path = {}

function Path:getInstance()
  local o = {path = ''}
  setmetatable(o, self)
  self.__index = self

  return o
end

-- Get Current file path.
function Path:getCurrentFilePath()
  self.path = debug.getinfo(2).source:sub(2)
  return self
end

-- Get Directory path
function Path:getDirName() 
  local file = String:getInstance(self.path):split('/')
  table.remove(file)
  self.path = '/' .. table.concat(file, '/')
  return self
end


return Path
