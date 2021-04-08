local Treesitter = {}

function Treesitter.config()
  require "nvim-treesitter.configs".setup {
    highlight = {
      enable = true
    }
  }
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Treesitter})
    return self
  end
}
setmetatable(Treesitter, metatable)

return Treesitter
