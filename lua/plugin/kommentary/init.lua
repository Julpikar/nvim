local Kommentary = {}

local function set_keymap()
  local remap = vim.api.nvim_set_keymap
  remap("v", "<leader>ci", "<Plug>kommentary_visual_increase", {})
  remap("v", "<leader>cd", "<Plug>kommentary_visual_decrease", {})
end

function Kommentary.config()
  set_keymap()
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Kommentary})
    return self
  end
}
setmetatable(Kommentary, metatable)

return Kommentary
