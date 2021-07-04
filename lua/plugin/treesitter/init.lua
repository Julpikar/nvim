local Treesitter = {}

function Treesitter.config()
  -- TreeSitter config
  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true
    },
    rainbow = {
      enable = true,
      extended_mode = true -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    }
  }

  -- Folding
  vim.cmd [[set foldmethod=expr]]
  vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
  vim.cmd [[set foldlevel=99]]
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
