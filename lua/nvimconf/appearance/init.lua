local M = {}

function M.init()
  require("nvimconf/appearance/colorizer").init()
  require("nvimconf/appearance/focusing").init()
  require("nvimconf/appearance/icon").init()
  local path = "nvimconf/appearance/"
  local configs = {
    "colorizer",
    "focusing",
    "icon"
  }

  vim.o.background = "dark"
  vim.cmd("colorscheme nord")
  vim.cmd("set guioptions=egm")
  vim.cmd("set guioptions-=r")
  vim.cmd("set guioptions-=b")
  vim.cmd("set guioptions-=T")
  vim.cmd("set guioptions-=L")
  vim.cmd("set guioptions-=set number")

  vim.cmd("autocmd!")
  vim.cmd("autocmd BufEnter,FocusGained,InsertLeave * set relativenumber")
  vim.cmd("autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber")
  vim.cmd("augroup END")

  vim.o.termguicolors = true
  vim.o.guifont = "Delugia Nerd Font:h10"
  vim.o.number = true
  vim.o.wrap = true
  vim.o.list = true
  vim.o.fdm = "indent"
  vim.o.fdc = "1"
  vim.o.fdl = 1
  vim.o.foldlevel = 99
  vim.o.splitright = true
  vim.o.splitbelow = true
  vim.o.lines = 999
  vim.o.columns = 999
end

return M
