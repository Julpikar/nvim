local colorscheme = require("local.colorscheme")
local lastplace = require("local.lastplace")
local number = require("local.number")
local mapping = require("local.mapping")

local cmd = vim.cmd
local o = vim.o

local Global = {}

function Global.load_settings()
  colorscheme("onedark")

  -- Windows mapping
  cmd("source $VIMRUNTIME/mswin.vim")

  -- Safe heaven
  cmd("set swapfile")
  cmd("set undofile")

  -- Window split
  o.splitright = true
  o.splitbelow = true

  -- Mouse support
  o.mouse = "a"

  -- Font setting
  o.guifont = "Hasklug NF:h9"

  -- Line number setting
  number.setup()

  -- Indentation setting
  o.autoindent = true
  o.shiftwidth = 2

  -- Tab setting
  o.tabstop = 2
  o.softtabstop = 2
  o.expandtab = true

  -- Wrap text
  o.wrap = true

  -- Postponed redraw
  o.lazyredraw = true

  -- Goto last position when open a file
  lastplace()

  -- Mapping
  mapping()
end

return Global
