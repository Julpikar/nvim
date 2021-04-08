local cmd = vim.cmd
local g = vim.g

local Colorscheme = {}

function Colorscheme.config()
  cmd("colorscheme gruvbox-material")
  g.gruvbox_material_palette = "original"
  g.gruvbox_material_background = "medium"
  g.gruvbox_material_enable_bold = true
  g.gruvbox_material_enable_italic = true
  g.gruvbox_material_cursor = "green"
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Colorscheme})
    return self
  end
}
setmetatable(Colorscheme, metatable)

return Colorscheme
