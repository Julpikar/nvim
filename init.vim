" ----------------------------------------------------------------------------
" Auto-Update Setting in init.vim
" ----------------------------------------------------------------------------
augroup vimrc                " Source vim configuration upon save
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END

" ----------------------------------------------------------------------------
" Plugin Install
" ----------------------------------------------------------------------------
call plug#begin('~/AppData/Local/nvim-data/site/autoload')
    " init
	Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-sensible'

    " colorscheme
	Plug 'sainnhe/edge'
    Plug 'sainnhe/forest-night'
    Plug 'sainnhe/sonokai'
    Plug 'morhetz/gruvbox'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'kaicataldo/material.vim'
    Plug 'glepnir/oceanic-material'
    Plug 'joshdick/onedark.vim'
    Plug 'liuchengxu/space-vim-theme'
    Plug 'ajmwagar/vim-deus'
    Plug 'tyrannicaltoucan/vim-quantum'
	Plug 'lifepillar/vim-solarized8'

    " editing
	Plug 'jiangmiao/auto-pairs'
    Plug 'ntpeters/vim-better-whitespace' " whitespace
    Plug 'junegunn/vim-easy-align'
    Plug 'farmergreg/vim-lastplace' "reopen files at your last edit position
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-surround'

    " utilities
    Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
	Plug 'maximbaz/lightline-ale'
	Plug 'mengelbrecht/lightline-bufferline'
	Plug 'preservim/nerdcommenter'
	Plug 'preservim/nerdtree'
	Plug 'mhinz/vim-startify'
    Plug 'liuchengxu/vista.vim'

    " linter
    Plug 'dense-analysis/ale'

    " language server
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " html
    Plug 'othree/html5.vim',{ 'on_ft' : ['html']}
	Plug 'cakebaker/scss-syntax.vim',{ 'on_ft' : ['scss','sass']}
	Plug 'ap/vim-css-color',{ 'on_ft' : ['css','scss','sass','less','styl']}
    Plug 'hail2u/vim-css3-syntax',{ 'on_ft' : ['css','scss','sass']}
    Plug 'groenewege/vim-less',{ 'on_ft' : ['less']}

    " go
    Plug 'fatih/vim-go',{ 'on_ft' : 'go' }

    " julia
    Plug 'JuliaEditorSupport/julia-vim'

    " php
    Plug 'StanAngeloff/php.vim',{ 'on_ft' : 'php'}
    Plug '2072/PHP-Indenting-for-VIm',{ 'on_ft' : 'php'}
	Plug 'rafi/vim-phpspec',{ 'on_ft' : 'php'}

    " rust
    Plug 'rust-lang/rust.vim'

    " snippets
    Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'

    " git
    Plug 'jreybert/vimagit'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-rhubarb'

    " python
    Plug 'cjrh/vim-conda'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'Vimjas/vim-python-pep8-indent'

    " sql
    Plug 'tpope/vim-dadbod',{'merged' : 0}

    " testing
    Plug 'vim-test/vim-test'

    " toml
    Plug 'cespare/vim-toml',{'merged' : 0}

    " vimscript
    Plug 'rbtnn/vim-vimscript_indentexpr'

    " typescript
    Plug 'pangloss/vim-javascript'    " JavaScript support
    Plug 'leafgarland/typescript-vim' " TypeScript syntax
    Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
call plug#end()

" ----------------------------------------------------------------------------
" System Setting
" ----------------------------------------------------------------------------
" Python Executable
let g:python_host_skip_check = 1
let g:python2_host_skip_check = 1
let g:python3_host_skip_check = 1

if executable('python2')
	let g:python_host_prog=system('where python2')
endif

if executable('python3')
	let g:python3_host_prog='C:\Users\benawas\Miniconda3\python.exe'
endif

" ----------------------------------------------------------------------------
" Look n Feel
" ----------------------------------------------------------------------------
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

" Statusline and Tabline
let g:lightline = {
	\'colorscheme': 'material',
	\'active': {
		\'left' :[['mode', 'paste' ],
			\['fugitive', 'readonly' ],
			\['filename', 'modified' ],
			\['method'],
			\['cocstatus'],
            \],
		\'right':[
			\['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
			\['lineinfo' ],
			\['percent' ],
			\['filetype', 'fileencoding', 'fileformat' ]
            \]
		\},
	\'component': {
		\'lineinfo': ' %3l:%-2v',
		\'filename': '%<%f'
		\},
	\'component_function': {
        \'cocstatus': 'coc#status',
		\'method': 'NearestMethodOrFunction',
		\'fugitive': 'LightlineFugitive',
		\'readonly': 'LightlineReadonly',
		\'modified': 'LightlineModified',
		\'fileformat': 'MyFileformat',
		\'filetype': 'MyFiletype',
		\}
	\}

let g:lightline.separator = {
    \'left': "", 'right': ""
    \}

let g:lightline.subseparator = {
	\'left': "|", 'right': "|"
	\}

let g:lightline.tabline = {
	\'left': [['buffers']],
    \'right': [["username"],["bufferstitle"]],
	\}

let g:lightline.component_expand = {
	\'buffers': 'lightline#bufferline#buffers',
    \'username': 'LightlineGitUserName',
    \'bufferstitle': 'BufferTitle',
	\'linter_checking': 'lightline#ale#checking',
	\'linter_infos': 'lightline#ale#infos',
	\'linter_warnings': 'lightline#ale#warnings',
	\'linter_errors': 'lightline#ale#errors',
	\'linter_ok': 'lightline#ale#ok',
    \'status': 'lightline#coc#status',
	\}

let g:lightline.component_type = {
	\'buffers': 'tabsel',
	\'linter_checking': 'right',
	\'linter_infos': 'right',
	\'linter_warnings': 'warning',
	\'linter_errors': 'error',
	\'linter_ok': 'right',
	\}

let g:lightline#bufferline#unnamed ="Untitled"
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#clickable = 1
let g:lightline.component_raw = {'buffers': 1}

function! LightlineModified()
	return &modified ? '●' : ''
endfunction

function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ' '.branch : ''
	endif
	return fugitive#head()
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineGitUserName()
    return "\uF2BD\u0020".matchstr(system('git config user.name'),'[A-Za-z0-9]*')
endfunction

function! BufferTitle()
    return "\uE257\u0020BUFFERS"
endfunction

" autoreload
command! LightlineReload call LightlineReload()

function! LightlineReload()
	call lightline#init()
	call lightline#colorscheme()
	call lightline#update()
endfunction

set splitbelow
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

" Vim-Devicons
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" ----------------------------------------------------------------------------
" Text Editing Setting
" ----------------------------------------------------------------------------
source $VIMRUNTIME/mswin.vim     " Windows Mapping
set mouse=a                      " Enable mouse click
set tabstop=4
set shiftwidth=4
set expandtab
set undofile

" ----------------------------------------------------------------------------
" Utilities
" ----------------------------------------------------------------------------
" NerdTree
let g:NERDTreeDirArrowExpandable = '╰▸'
let g:NERDTreeDirArrowCollapsible = '├▸'
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1

nnoremap <silent><F3> :NERDTreeToggle<CR>
inoremap <silent><F3> :NERDTreeToggle<CR>
vnoremap <silent><F3> :NERDTreeToggle<CR>

nnoremap <silent><F4> :NERDTreeToggleVCS<CR>
inoremap <silent><F4> :NERDTreeToggleVCS<CR>
vnoremap <silent><F4> :NERDTreeToggleVCS<CR>

" Startify
let g:startify_lists = [
	\{ 'type': 'files',     'header': ['   Files']},
	\{ 'type': 'dir',       'header': ['   Current Directory '. getcwd()]},
	\{ 'type': 'sessions',  'header': ['   Sessions']},
	\{ 'type': 'bookmarks', 'header': ['   Bookmarks']},
	\]

let g:startify_bookmarks = [
	\{'Config':"~/AppData/Local/nvim/init.vim"},
	\]

let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1

nnoremap <silent><home> :Startify<CR>
inoremap <silent><home> :Startify<CR>
vnoremap <silent><home> :Startify<CR>

" Vista
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fold_toggle_icons = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_disable_statusline = 1
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
	\"function": "\uf794",
	\"variable": "\uf71b",
	\}

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

"set statusline+=%{NearestMethodOrFunction()}

nnoremap <silent><F9> :Vista!!<CR>
inoremap <silent><F9> :Vista!!<CR>
vnoremap <silent><F9> :Vista!!<CR>

" ----------------------------------------------------------------------------
" Language Server Setting
" ----------------------------------------------------------------------------
autocmd CursorHold,CursorHoldI :call <SID>show_documentation()<CR>
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
" ----------------------------------------------------------------------------
" Linter Setting
" ----------------------------------------------------------------------------
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_virtualtext_cursor = 1
let g:ale_linters={
	\'rust':['rust_analyzer','cargo']
	\}
let g:ale_fixers ={
	\'go':['goimports','gofmt'],
	\}

let g:ale_fix_on_save = 1
let g:ale_set_ballons = 1
let g:ale_hover_to_preview = 1

highlight link ALEWarningSign Todo
highlight link ALEErrorSign WarningMsg
highlight link ALEVirtualTextWarning Todo
highlight link ALEVirtualTextInfo Todo
highlight link ALEVirtualTextError WarningMsg

let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071\u0020"
let g:lightline#ale#indicator_errors = "\uf05e\u0020"
let g:lightline#ale#indicator_ok = "\uf00c"

" ----------------------------------------------------------------------------
" Programming Language Specific Setting
" ----------------------------------------------------------------------------
" go
let g:go_gopls_enabled = 0

" rust
let g:rustfmt_autosave = 1

" typescript
let g:typescript_indent_disable = 1
