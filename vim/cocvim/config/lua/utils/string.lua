String = {}

function String:getInstance(str)
  local o = {string = str}
  setmetatable(o, self)
  self.__index = self
  return o
end

--
-- split string
--
function String:split(sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(self.string, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

return String
