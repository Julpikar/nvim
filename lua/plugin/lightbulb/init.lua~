local Lightbulb = {}

function Lightbulb.config()
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Lightbulb})
    return self
  end
}
setmetatable(Lightbulb, metatable)

return Lightbulb
