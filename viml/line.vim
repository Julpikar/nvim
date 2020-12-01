set noshowmode

let g:lightline = {
	\'colorscheme': 'forest_night',
	\'active': {
		\'left' :[['mode', 'paste' ],
			\['fugitive', 'readonly' ],
			\['filename', 'modified' ],
			\['method'],
            \['coc_status'],
            \],
		\'right':[
			\[ 'coc_errors', 'coc_warnings', 'coc_ok' ],
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
		\'method': 'NearestMethodOrFunction',
		\'lspStatus': 'LspStatus',
		\'fugitive': 'LightlineFugitive',
		\'readonly': 'LightlineReadonly',
		\'modified': 'LightlineModified',
		\'fileformat': 'MyFileformat',
		\'filetype': 'MyFiletype',
		\}
	\}

let g:lightline.separator = {
    \'left': "\ue0b8", 'right': "\ue0ba"
    \}

let g:lightline.subseparator = {
	\'left': "\ue0b9", 'right': "\ue0bb"
	\}

let g:lightline.tabline_separator =  {
    \'left': "\ue0bc", 'right': "\ue0be"
    \}

let g:lightline.tabline_subseparator =  {
    \'left': "\ue0bb", 'right': "\ue0b9"
    \}

let g:lightline.tabline = {
	\'left': [['buffers']],
    \'right': [["username"],["bufferstitle"]],
	\}

let g:lightline.component_expand = {
	\'buffers': 'lightline#bufferline#buffers',
    \'username': 'LightlineGitUserName',
    \'bufferstitle': 'BufferTitle',
    \'coc_warnings': 'lightline#coc#warnings',
  	\'coc_errors': 'lightline#coc#errors',
  	\'coc_ok': 'lightline#coc#ok',
    \'coc_status': 'lightline#coc#status',
	\}

let g:lightline.component_type = {
	\'buffers': 'tabsel',
	\'coc_warnings': 'warning',
  	\'coc_errors': 'error',
  	\'coc_ok': 'left',
	\}

let g:lightline#bufferline#unnamed ="Untitled"
let g:lightline#bufferline#show_number = 0
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#clickable = 1
let g:lightline.component_raw = {'buffers': 1}

let g:lightline#coc#indicator_warnings = "\uf071\u0020"
let g:lightline#coc#indicator_errors = "\uf05e\u0020"
let g:lightline#coc#indicator_ok = "\uf00c"

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
    return "\uf1d3\u0020".matchstr(system('git config user.name'),'[A-Za-z0-9]*')
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