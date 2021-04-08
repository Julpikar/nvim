local Treesitter = {}

function Treesitter.config()
  require "nvim-treesitter.configs".setup {
    highlight = {
      enable = true
    },
    rainbow = {
      enable = true,
      extended_mode = true -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
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
