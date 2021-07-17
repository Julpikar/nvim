local Navigator = {}

 function Navigator.keymap()
  -- Keybindings
  local remap = vim.api.nvim_set_keymap
  local opts = {noremap = true, silent = true}

  remap("n", "A", "<CMD>lua require('Navigator').left()<CR>", opts)
  remap("n", "W", "<CMD>lua require('Navigator').up()<CR>", opts)
  remap("n", "D", "<CMD>lua require('Navigator').right()<CR>", opts)
  remap("n", "S", "<CMD>lua require('Navigator').down()<CR>", opts)
  remap("n", "Z", "<CMD>lua require('Navigator').previous()<CR>", opts)
end

function Navigator.config()
  -- Configuration
  require("Navigator").setup(
    {
      auto_save = "current",
      disable_on_zoom = true
    }
  )
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Navigator})
    return self
  end
}
setmetatable(Navigator, metatable)

return Navigator
