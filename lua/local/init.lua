local autosave = require("local.autosave")
local diagnostic = require("local.diagnostic")
local lastplace = require("local.lastplace")
local lsp = require("local.lsp")
local number = require("local.number")
local root = require("local.root")
local rules = require("local.rules")
local theme = require("local.theme")

local o = vim.o

local Local = {}

function Local.setup()
  o.guicursor =
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

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

  -- Length a line
  o.textwidth = 80

  -- AutoSave
  autosave.setup()

  -- Diagnostic setting
  diagnostic.setup()

  -- Goto last position when open a file
  lastplace.setup()

  -- LSP support
  lsp.setup()

  -- Line number setting
  number.setup()

  -- Find root file
  root.setup()

  -- Editing rules
  rules.setup()

  -- Theme
  theme.setup()

  -- Key Mapping
  local keys = {
    { "n", "=h", "<CMD>wincmd h<CR>" },
    { "n", "=k", "<CMD>wincmd k<CR>" },
    { "n", "=l", "<CMD>wincmd l<CR>" },
    { "n", "=j", "<CMD>wincmd j<CR>" },
    { "n", "<LEADER>bd", "<CMD>bdelete<CR>" },
    { "n", "<LEADER>bD", "<CMD>%bdelete<CR>" },
    { "n", "]b", "<CMD>bnext<CR>" },
    { "n", "[b", "<CMD>bprevious<CR>" },
    { { "n", "v" }, "<LEADER>n", "<CMD>NumberOnOff<CR>" },
    { { "n", "v" }, "<LEADER>q", "<CMD>quit<CR>" },
    { { "n", "v" }, "<LEADER>vs", "<CMD>vsplit<CR>" },
    { { "n", "v" }, "<LEADER>hs", "<CMD>split<CR>" },
  }

  local keymap_set = vim.keymap.set
  for _, key in pairs(keys) do
    keymap_set(unpack(key))
  end
end

return Local
