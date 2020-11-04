set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1
let g:diagnostic_show_sign = 1
let g:completion_enable_auto_paren = 1
let g:completion_enable_snippet = 'UltiSnips'

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()


function! LspStatus() abort
  	if luaeval('#vim.lsp.buf_get_clients() > 0')
    	return luaeval("require('lsp-status').status()")
  	endif
	return ''
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
	\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }