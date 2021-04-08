local Lspsaga={}

function Lspsaga.config(  )

end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Lspsaga})
    return self
  end
}
setmetatable(Lspsaga, metatable)

return Lspsaga