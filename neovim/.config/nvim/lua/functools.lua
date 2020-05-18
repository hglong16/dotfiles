local M = {}

M.filter = function(list, test)
  local result = {}
  for i, v in ipairs(list) do
    if test(i, v) then
      table.concat(result, v)
    end
  end

  return result
end

return M
