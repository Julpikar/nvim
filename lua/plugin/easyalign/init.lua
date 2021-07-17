local Easyalign = {}

function Easyalign.keymap()
  local remap = vim.api.nvim_set_keymap
  -- Start interactive EasyAlign in visual mode (e.g. vipga)
  remap("x", "ga", "<Plug>(EasyAlign)", {silent = true})

  -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
  remap("n", "ga", "<Plug>(EasyAlign)", {silent = true})
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Easyalign})
    return self
  end
}
setmetatable(Easyalign, metatable)

return Easyalign
