local autosave = require("local.autosave")
local colorscheme = require("local.colorscheme")
local lastplace = require("local.lastplace")
local number = require("local.number")
local root = require("local.root")

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

  -- colorscheme
  colorscheme.setup()

  -- Goto last position when open a file
  lastplace.setup()

  -- Line number setting
  number.setup()

  -- Find root file
  root.setup()

  -- Key Mapping
  local keys = {
    { "n", "wh", "<CMD>wincmd h<CR>" },
    { "n", "wk", "<CMD>wincmd k<CR>" },
    { "n", "wl", "<CMD>wincmd l<CR>" },
    { "n", "wj", "<CMD>wincmd j<CR>" },
    { "n", "bd", "<CMD>bdelete<CR>" },
    { "n", "b]", "<CMD>bnext<CR>" },
    { "n", "b[", "<CMD>previous<CR>" },
    { { "n", "v" }, "<LEADER>n", "<CMD>NumberOnOff<CR>" },
    { { "n", "v" }, "<LEADER>q", "<CMD>quit<CR>" },
    { { "n", "v" }, "<LEADER>vs", "<CMD>vsplit<CR>" },
    { { "n", "v" }, "<LEADER>vh", "<CMD>split<CR>" },
  }

  local keymap_set = vim.keymap.set
  for _, key in pairs(keys) do
    keymap_set(unpack(key))
  end
end

return Local
