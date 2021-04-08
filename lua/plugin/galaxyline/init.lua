local Galaxy={}

function Galaxy.config(  )

end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Galaxy})
    return self
  end
}
setmetatable(Galaxy, metatable)

return Galaxy