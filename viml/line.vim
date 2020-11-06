let g:lightline = {
	\'colorscheme': 'material',
	\'active': {
		\'left' :[['mode', 'paste' ],
			\['fugitive', 'readonly' ],
			\['filename', 'modified' ],
			\['method'],
			\['lspStatus']
            \],
		\'right':[
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
	\}

let g:lightline.component_type = {
	\'buffers': 'tabsel',
	\}

let g:lightline#bufferline#unnamed ="Untitled"
let g:lightline#bufferline#show_number = 0
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
    return "\uE36E\u0020".matchstr(system('git config user.name'),'[A-Za-z0-9]*')
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
