local cmd = vim.cmd
local g = vim.g
local o = vim.o

local Global = {}

function Global.load_settings()
  -- Enable 24-bit RGB color
  o.termguicolors = true

  -- I want make it fast
  o.lazyredraw = true

  -- Windows mapping
  cmd("source $VIMRUNTIME/mswin.vim")

  -- Safe Heaven
  cmd("set swapfile")
  cmd("set undofile")

  -- Window Split
  o.splitright = true
  o.splitbelow = true

  -- Mouse Support
  o.mouse = "a"

  -- Font Setting
  o.guifont = "SauceCodePro Nf:h9"

  -- Indentation Setting
  vim.cmd[[set autoindent]]
  o.shiftwidth = 2

  -- Tab Setting
  o.tabstop = 2
  o.softtabstop = 2
  o.expandtab = true

  -- Wrap text
  o.wrap = true

  -- Postponed redraw
  o.lazyredraw = true
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Global})
    return self
  end
}
setmetatable(Global, metatable)

return Global
