vim.cmd("colorscheme oceanic_material")
vim.o.background = 'dark'

vim.o.guifont = 'SauceCodePro NF:h11'
vim.o.number = true
vim.cmd(
	[===[
		set showtabline=2  " Show tabline
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

vim.cmd(
	[===[
		function! MyFiletype()
		    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
		endfunction

		function! MyFileformat()
		    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
		endfunction
	]===]
)