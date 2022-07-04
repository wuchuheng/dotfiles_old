local Table = {}

function Table:getInstance(obj) 
  obj = obj or {}
  local data = obj
  setmetatable(data, self)
  self.__index = self

  return data
end

-- filter lambda loop function 
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

-- Map lambda loop function 
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

-- Get Table size
function Table:getLength()
  local size = 0
  for _ in pairs(self) do size = size + 1 end
  return size
end

-- Check has this value
function Table:hasValue(v)
  for _, value in ipairs(self) do
    if value == v then
      return true
    end
  end
  return false
end
-- Check the Data is Array.
function Table:isArray()
 for key, _ in pairs(self) do
   if (type(key) ~= 'number') then
     return false
   end
 end 

 return true
end


return Table
