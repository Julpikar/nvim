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
    cmd("NumberDisable")
    cmd("ScrollViewDisable")
  end

  true_zen.after_mode_ataraxis_off = function()
    cmd("NumberEnable")
    cmd("ScrollViewEnable")
    cmd("ScrollViewRefresh")
  end
end

function TrueZen.keymap()
  vim.keymap.set({"n", "i", "v"}, "<F12>", "<CMD>TZAtaraxis<CR>", {silent = true})
end

return TrueZen
