" ColorScheme
"colorscheme quantum
"colorscheme deus
colorscheme oceanic_material
"colorscheme space_vim_theme
"colorscheme material
"let g:material_theme_style = 'palenight'
"let g:material_terminal_italics = 1
"colorscheme gruvbox
set background =dark

" Font
set guifont =SauceCodePro\ NF:h11   "cANSI
"set guifont =JuliaMono:h10
"set linespace =1

set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L

set showtabline=2  " Show tabline
set guioptions-=set number

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

set wrap
set list

set fdm=indent
set fdc=1
set fdl=1
set foldlevel=99

set splitright
set splitbelow

" Vim-Devicons
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
