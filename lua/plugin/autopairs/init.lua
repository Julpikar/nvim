local AutoPairs = {}

function AutoPairs.config()
  local remap = vim.api.nvim_set_keymap
  local npairs = require("nvim-autopairs")

  -- skip it, if you use another global object
  _G.MUtils = {}

  vim.g.completion_confirm_key = ""
  MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
      if vim.fn.complete_info()["selected"] ~= -1 then
        return vim.fn["compe#confirm"](npairs.esc("<cr>"))
      else
        return npairs.esc("<cr>")
      end
    else
      return npairs.autopairs_cr()
    end
  end

  remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})

  npairs.setup(
    {
      check_ts = true,
      ts_config = {
        lua = {"string"},
        javascript = {"template_string"}
      }
    }
  )

  require("nvim-treesitter.configs").setup {
    autopairs = {enable = true}
  }
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = AutoPairs})
    return self
  end
}
setmetatable(AutoPairs, metatable)

return AutoPairs
