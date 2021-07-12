local TrueZen = {}

function TrueZen.config()
  local cmd = vim.cmd
  local true_zen = require("true-zen")
  true_zen.setup(
    {
      integrations = {
        galaxyline = true,
        gitsigns = true,
        nvim_bufferline = true
      }
    }
  )

  true_zen.before_mode_ataraxis_on = function()
    cmd [[NumbersDisable]]
    cmd [[ScrollViewDisable]]
  end

  true_zen.after_mode_ataraxis_off = function()
    cmd [[NumbersEnable]]
    cmd [[ScrollViewEnable]]
    cmd [[ScrollViewRefresh]]
  end

  local remap = vim.api.nvim_set_keymap
  remap("n", "<F12>", "<CMD>TZAtaraxis<CR>", {silent = true})
  remap("i", "<F12>", "<CMD>TZAtaraxis<CR>", {silent = true})
  remap("v", "<F12>", "<CMD>TZAtaraxis<CR>", {silent = true})
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = TrueZen})
    return self
  end
}
setmetatable(TrueZen, metatable)

return TrueZen
