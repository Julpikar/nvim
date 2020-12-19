--vim.g.termguicolors = true

--vim.g.sonokai_style = 'atlantis'
--vim.g.sonokai_enable_italic = 1
--vim.g.sonokai_disable_italic_comment = 1
--vim.cmd('colorscheme sonokai')
--vim.cmd("colorscheme forest-night")
--vim.g.forest_night_diagnostic_line_highlight = 1
--vim.cmd("colorscheme oceanic_material")
vim.cmd('colorscheme night-owl')
vim.o.guifont = 'SauceCodePro NF:h11'
--vim.o.guifont = 'Fira Code:h10'
vim.o.number = true
vim.cmd(
    [===[
    set guioptions-=T "remove toolbar
    set guioptions-=r "remove right-hand scroll bar
    set guioptions-=L
    set guioptions-=set number

    augroup Numbertoggle
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
    icon = "",
    color = "#428850",
    name = "Zsh"
    }
    };
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
    }
