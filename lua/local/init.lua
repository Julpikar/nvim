local autosave = require("local.autosave")
local cursor = require("local.cursor")
local lastplace = require("local.lastplace")
local number = require("local.number")
local o = vim.o

local Local = {}

function Local.setup()
  -- Safe heaven
  o.swapfile = true
  o.undofile = true

  -- Window split
  o.splitright = true
  o.splitbelow = true

  -- Indentation setting
  o.autoindent = true
  o.shiftwidth = 2

  -- Tab setting
  o.tabstop = 2
  o.softtabstop = 2
  o.expandtab = true

  -- Fold
  o.foldcolumn = "2"
  o.foldlevel = 99
  o.foldlevelstart = 99
  o.foldenable = true
  o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

  -- AutoSave
  autosave.setup()

  -- Smooth cursor
  cursor.setup()

  -- Goto last position when open a file
  lastplace.setup()

  -- Line number setting
  number.setup()

  -- Key Mapping
  local keys = {
    { "n", "wh", "<CMD>wincmd h<CR>" },
    { "n", "wk", "<CMD>wincmd k<CR>" },
    { "n", "wl", "<CMD>wincmd l<CR>" },
    { "n", "wj", "<CMD>wincmd j<CR>" },
    { "n", "wn", "<CMD>bnext<CR>" },
    { "n", "wb", "<CMD>previous<CR>" },
    { { "n", "v" }, "<LEADER>n", "<CMD>NumberOnOff<CR>" },
    { { "n", "v" }, "<LEADER>q", "<CMD>quit<CR>" },
  }

  local keymap_set = vim.keymap.set
  for _, key in pairs(keys) do
    keymap_set(unpack(key))
  end
end

return Local
