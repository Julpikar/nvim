local Lightbulb = {}

function Lightbulb.config()
  require("nvim-lightbulb").update_lightbulb {
    sign = {
      enabled = false
    }
  }
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]
end

return Lightbulb
