local Trouble = {}

function Trouble.config()
  require("trouble").setup {
    action_keys = {
      -- key mappings for actions in the trouble list
      close = "<LEADER>c", -- close the list
      cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
      refresh = "<LEADER>v", -- manually refresh
      jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
      jump_close = {"<LEADER>j"}, -- jump to the diagnostic and close the list
      toggle_mode = "<LEADER>m", -- toggle between "workspace" and "document" diagnostics mode
      toggle_preview = "<LEADER>a", -- toggle auto_preview
      hover = "<LEADER>k", -- opens a small poup with the full multiline message
      preview = "<LEADER>p", -- preview the diagnostic location
      close_folds = {"zM", "zm"}, -- close all folds
      open_folds = {"zR", "zr"}, -- open all folds
      toggle_fold = {"zA", "za"}, -- toggle fold of current file
      previous = "k", -- preview item
      next = "j" -- next item
    }
  }
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Trouble})
    return self
  end
}
setmetatable(Trouble, metatable)

return Trouble
