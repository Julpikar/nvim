local Floaterm = {}

function Floaterm.setup()
  local g = vim.g
  g.floaterm_width = 0.8
  g.floaterm_height = 0.8
  g.floaterm_autoclose = 1
  g.floaterm_autoinsert = 1
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Floaterm})
    return self
  end
}
setmetatable(Floaterm, metatable)

return Floaterm
