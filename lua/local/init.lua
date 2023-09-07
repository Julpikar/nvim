local autosave = require("local.autosave")
local cursor = require("local.cursor")
local lastplace = require("local.lastplace")
local number = require("local.number")
local o = vim.o

local Local = {}

function Local.setup()
  -- Indentation setting
  o.autoindent = true
  o.shiftwidth = 2

  -- Tab setting
  o.tabstop = 2
  o.softtabstop = 2
  o.expandtab = true

  -- AutoSave
  autosave.setup()

  -- Smooth cursor
  cursor.setup()

  -- Goto last position when open a file
  lastplace.setup()

  -- Line number setting
  number.setup()

  -- Key Mapping
  local opts = { noremap = true, silent = true }
  local keys = {
    { "n", "wh", "<CMD>wincmd h<CR>", opts },
    { "n", "wk", "<CMD>wincmd k<CR>", opts },
    { "n", "wl", "<CMD>wincmd l<CR>", opts },
    { "n", "wj", "<CMD>wincmd j<CR>", opts },
    { "n", "wn", "<CMD>bnext<CR>", opts },
    { "n", "wb", "<CMD>previous<CR>", opts },
  }

  local keymap_set = vim.keymap.set
  for _, key in pairs(keys) do
    keymap_set(unpack(key))
  end
end

return Local
