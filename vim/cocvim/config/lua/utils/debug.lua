Debug = {}

local function dump(obj) 
   if type(obj) == 'table' then
      local s = '{ '
      for k,v in pairs(obj) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
     return tostring(obj)
   end
end


-- Print table data.
function Debug.dump (obj)
  print(dump(obj))
end

return Debug
