local Compe = {}

local function set_keymap()
  local remap = vim.api.nvim_set_keymap
  local opts = {noremap = true, silent = true, expr = true}
  remap("i", "<C-Space>", "compe#complete()", opts)
  remap("i", "<CR>", "compe#confirm({ 'keys': '<Plug>delimitMateCR', 'mode': '' })", opts)
  remap("i", "<C-e>", "compe#close('<C-e>')", opts)
  remap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", opts)
  remap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", opts)
end

function Compe.config()
  vim.o.completeopt = "menuone,noselect"
  vim.cmd("set pumheight=15")
  vim.cmd("set shortmess+=c")

  require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "always",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
      path = true,
      buffer = true,
      calc = true,
      nvim_lsp = true,
      nvim_lua = true,
      vsnip = true
    }
  }
  set_keymap()
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Compe})
    return self
  end
}
setmetatable(Compe, metatable)

return Compe
