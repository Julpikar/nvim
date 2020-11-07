" Nerdtree
nnoremap <silent><F3> :NERDTreeToggle<CR>
inoremap <silent><F3> :NERDTreeToggle<CR>
vnoremap <silent><F3> :NERDTreeToggle<CR>

nnoremap <silent><F4> :NERDTreeToggleVCS<CR>
inoremap <silent><F4> :NERDTreeToggleVCS<CR>
vnoremap <silent><F4> :NERDTreeToggleVCS<CR>

" Startify
nnoremap <silent><home> :Startify<CR>
inoremap <silent><home> :Startify<CR>
vnoremap <silent><home> :Startify<CR>

nnoremap <silent><F9> :Vista!!<CR>
inoremap <silent><F9> :Vista!!<CR>
vnoremap <silent><F9> :Vista!!<CR>

" Telescope
nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<CR>
nnoremap <Leader>c <cmd>lua require'telescope.builtin'.treesitter{}<CR>

" CoC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
 
inoremap <silent><expr> <TAB>
    \pumvisible() ? "\<C-n>" :
    \<SID>check_back_space() ? "\<TAB>" :
    \coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  	let col = col('.') - 1
  	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  	if (index(['vim','help'], &filetype) >= 0)
    	execute 'h '.expand('<cword>')
  	elseif (coc#rpc#ready())
    	call CocActionAsync('doHover')
  	else
    	execute '!' . &keywordprg . " " . expand('<cword>')
  	endif
endfunction