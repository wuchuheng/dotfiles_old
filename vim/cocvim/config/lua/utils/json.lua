local Table = require('utils.table')
local Module = { }

local function formatField(isArray, key, value)
  if isArray then
    return string.format("%s", value)
  end
  return string.format('"%s":%s', key, value)
end

-- Convert table data to string.
function Module.encode(data, level)
  level = level or 0
  local result = ''
  local size = 0
  local symbol = ''
  local tableSize =Table:getInstance(data):getLength() 
  local isArray = Table:getInstance(data):isArray()
  for index, value in pairs(data) do
    size = size + 1
    if (size < tableSize)  then
      symbol = ','
    else
      symbol = ''
    end
    local valueType = type(value)
    if (valueType == 'table') then
      result = result .. formatField(isArray, index, Module.encode(value, level + 1) .. symbol)
    elseif valueType == 'boolean' then
      local boolStr = 'true'
      if not value then
        boolStr = 'false'
      end
      result = result .. formatField(isArray, index, boolStr .. symbol)
    elseif valueType == 'number' then
      result = result .. formatField(isArray, index, string.format('%s', value) .. symbol)
    else 
      result = result .. formatField(isArray, index, string.format('"%s"', value) .. symbol)
    end
  end
  local leftSymbol = '{'
  local rightSymbol = '}'
  if isArray then
    leftSymbol = '['
    rightSymbol = ']'
  end
  return string.format("%s%s%s", leftSymbol, result, rightSymbol)
end

return Module
