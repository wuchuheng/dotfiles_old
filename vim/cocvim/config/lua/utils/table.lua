local Table = {}

function Table:getInstance(obj) 
  obj = obj or {}
  local data = obj
  setmetatable(data, self)
  self.__index = self

  return data
end

function Table:filter(callback)
  local res = {}
  for k, v in pairs(self) do
    local isOk = callback(k, v) or false
    if (isOk) then
    res[k] = v
    end
  end
  setmetatable(res, self)
  self.__index = self

  return res
end

function Table:map(callback)
  local res = {}
  for k, v in pairs(self) do
    res[k] = callback(k, v)
  end
  setmetatable(res, {__index = self})
  return res
end

function Table:foreach(callback)
  for k, v in pairs(self) do
     callback(k, v)
  end
end

function Table:hasValue(v)
  for _, value in ipairs(self) do
    if value == v then
      return true
    end
  end
  return false
end

return Table
