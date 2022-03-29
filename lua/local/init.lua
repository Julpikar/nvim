local colorscheme = require("local.colorscheme")
local cursor = require("local.cursor")
local lastplace = require("local.lastplace")
local number = require("local.number")
local mapping = require("local.mapping")
local autosave = require("local.autosave")
local cmd = vim.cmd
local o = vim.o

local Global = {}

function Global.load_settings()
  colorscheme.setup("onedark")

  -- Windows mapping
  cmd("source $VIMRUNTIME/mswin.vim")

  -- Safe heaven
  vim.o.swapfile = true
  vim.o.undofile = true

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

  -- Cursor fix
  cursor.setup()
  -- Goto last position when open a file
  lastplace.setup()

  -- Mapping
  mapping.setup()

  -- AutoSave
  autosave.setup()
end

return Global
