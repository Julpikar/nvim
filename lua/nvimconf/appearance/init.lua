require "nvimconf/appearance/colorizer"
require "nvimconf/appearance/focusing"
require "nvimconf/appearance/icon"

vim.o.background = "dark"
--vim.cmd("colorscheme nord")
--vim.cmd('colorscheme gruvbox')
--vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd("colorscheme oceanic_material")
vim.g.oceanic_material_background = "ocean" --ocean: #1b2b34 medium: #282C34 deep:#212112 darker:#1d1f21
vim.g.oceanic_material_allow_bold = false
vim.g.oceanic_material_allow_italic = false
vim.g.oceanic_material_allow_underline = true
vim.g.oceanic_material_allow_undercurl = true
vim.g.oceanic_material_allow_reverse = true

vim.cmd('set guioptions="egm"')
vim.cmd('set guioptions-="r"')
vim.cmd('set guioptions-="b"')
vim.cmd('set guioptions-="T"')
vim.cmd('set guioptions-="L"')
vim.cmd('set guioptions-=set number')

vim.cmd('autocmd!')
vim.cmd('autocmd BufEnter,FocusGained,InsertLeave * set relativenumber')
vim.cmd('autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber')
vim.cmd('augroup END')

vim.o.termguicolors = true
--vim.o.guifont = "SauceCodePro NF:h11"
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
