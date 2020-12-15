vim.cmd('source $VIMRUNTIME/mswin.vim') -- Windows Mapping
vim.o.mouse = 'a'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.undofile = true
vim.o.formatoptions = 'cqrnj'
vim.o.joinspaces = false
vim.o.incsearch = true

-- nvim-colorizer.lua
require'colorizer'.setup()
