vim.o.termguicolors = true

vim.cmd('colorscheme nord')
--vim.cmd('colorscheme gruvbox')
--vim.g.gruvbox_contrast_dark = 'hard'

vim.o.guifont = 'SauceCodePro NF:h11'
vim.o.number = true
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

vim.o.wrap = true
vim.o.list = true
vim.o.fdm = 'indent'
vim.o.fdc = '1'
vim.o.fdl = 1
vim.o.foldlevel = 99
vim.o.splitright = true
vim.o.splitbelow = true

require'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon  = "",
      color = "#428850",
      name  = "Zsh"
    }
  };
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}
