local cmd = vim.cmd
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
  o.autoindent = true
  o.shiftwidth = 2

  -- Tab Setting
  o.tabstop = 2
  o.softtabstop = 2
  o.expandtab = true

  -- Wrap text
  o.wrap = true

  -- Limit character per line
  cmd[[set textwidth=80]]
  cmd [[set colorcolumn=80]]

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
