require "nvimconf/appearance/colorizer"
require "nvimconf/appearance/focusing"
require "nvimconf/appearance/icon"

vim.cmd("colorscheme nord")
--vim.cmd('colorscheme gruvbox')
--vim.g.gruvbox_contrast_dark = 'hard'

vim.cmd('set guioptions="egm"')
vim.cmd(
  [===[
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L
set guioptions-=set number


autocmd!
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
]===]
)

vim.o.termguicolors = true
vim.o.guifont = "SauceCodePro NF:h11"
vim.o.number = true
vim.o.wrap = true
vim.o.list = true
vim.o.fdm = "indent"
vim.o.fdc = "1"
vim.o.fdl = 1
vim.o.foldlevel = 99
vim.o.splitright = true
vim.o.splitbelow = true
