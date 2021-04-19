local Delimit = {}

function Delimit.config()
  vim.g.delimitMate_expand_cr = 1
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Delimit})
    return self
  end
}
setmetatable(Delimit, metatable)

return Delimit
