local g = vim.g
local o = vim.o

g.mapleader = "`"
g.maplocalleader = "\\"

o.guicursor = "n-v-c:block,"
  .. "i-ci-ve:ver25,"
  .. "r-cr:hor20,"
  .. "o:hor50,"
  .. "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,"
  .. "sm:block-blinkwait175-blinkoff150-blinkon175"

o.clipboard = "unnamedplus"

-- Safe heaven
o.swapfile = true
o.updatetime = 1000
o.undofile = true
o.undolevels = 9999

-- Window
o.winborder = "single"
o.splitright = true
o.splitbelow = true

-- Indentation setting
o.smartindent = true
o.shiftwidth = 2
o.shiftround = true

-- Tab setting
o.tabstop = 2
o.expandtab = true

-- Search
o.ignorecase = true
o.smartcase = true

-- Fold
o.foldcolumn = "2"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Statusline
o.laststatus = 3
o.showmode = false
o.ruler = false

-- Wrap text
o.wrap = false
o.linebreak = true

-- Completion
o.completeopt = "menu,menuone,noselect"
o.pumblend = 10
o.pumheight = 10
o.wildmode = "longest:full,full"

-- Scroll
o.smoothscroll = true
o.scrolloff = 5
o.sidescrolloff = 8
