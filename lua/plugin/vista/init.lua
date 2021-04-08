local Vista = {}

function Vista.config()
  local remap = vim.api.nvim_set_keymap
  remap("n", "<F9>", "<CMD>Vista!!<CR>", {silent = true})
  remap("i", "<F9>", "<CMD>Vista!!<CR>", {silent = true})
  remap("v", "<F9>", "<CMD>Vista!!<CR>", {silent = true})
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Vista})
    return self
  end
}
setmetatable(Vista, metatable)

return Vista
