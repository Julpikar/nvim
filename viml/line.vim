let g:lightline = {
	\'colorscheme': 'material',
	\'active': {
		\'left' :[['mode', 'paste' ],
			\['fugitive', 'readonly' ],
			\['filename', 'modified' ],
			\['method'],
            \],
		\'right':[
			\['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
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
let g:lightline#bufferline#show_number = 0
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#clickable = 1
let g:lightline.component_raw = {'buffers': 1}

let g:lightline#ale#indicator_checking = "\uf110\u0020"
let g:lightline#ale#indicator_infos = "\uf129\u0020"
let g:lightline#ale#indicator_warnings = "\uf071\u0020"
let g:lightline#ale#indicator_errors = "\uf05e\u0020"
let g:lightline#ale#indicator_ok = "\uf00c\u0020"

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
    return "\uF1D3\u0020".matchstr(system('git config user.name'),'[A-Za-z0-9]*')
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
