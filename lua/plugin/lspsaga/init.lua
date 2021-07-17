local Lspsaga = {}

function Lspsaga.keymap()
  -- show hover doc
  vim.api.nvim_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", {silent = true})
  -- scroll down hover doc or scroll in definition preview
  vim.api.nvim_set_keymap("n", "w", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", {silent = true})
  -- scroll up hover doc
  vim.api.nvim_set_keymap(
    "n",
    "s",
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
    {silent = true}
  )
end

function Lspsaga.config()
  require("lspsaga").init_lsp_saga {
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = ""
  }
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Lspsaga})
    return self
  end
}
setmetatable(Lspsaga, metatable)

return Lspsaga
