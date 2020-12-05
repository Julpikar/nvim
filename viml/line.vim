set noshowmode

let g:lightline = {
	\'colorscheme': 'forest_night',
	\'active': {
		\'left' :[['mode', 'paste' ],
			\['fugitive', 'readonly' ],
			\['filename', 'modified' ],
            \['lspStatus']
            \],
		\'right':[
            \['lsp_errors', 'lsp_warnings', 'lsp_ok' ],
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
		\'lspStatus': 'LspStatus',
		\'fugitive': 'LightlineFugitive',
		\'readonly': 'LightlineReadonly',
		\'modified': 'LightlineModified',
		\'fileformat': 'LightlineFileformat',
		\'filetype': 'LightlineFiletype',
        \'lsp_warnings': 'LightlineLSPWarnings',
        \'lsp_errors': 'LightlineLSPErrors',
        \'lsp_ok': 'LightlineLSPOk'
		\}
	\}

let g:lightline.component_expand = {
	\'buffers': 'lightline#bufferline#buffers',
    \'username': 'LightlineGitUserName',
    \'bufferstitle': 'BufferTitle'
	\}

let g:lightline.component_type = {
	\'buffers': 'tabsel',
    \'lsp_warnings': 'warning',
    \'lsp_errors':'error',
    \'lsp_ok':'middle',
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
    return "\uf1d3\u0020".matchstr(system('git config user.name'),'[A-Za-z0-9]*')
endfunction

function! BufferTitle()
    return "\uE257\u0020BUFFERS"
endfunction

function! LightlineLSPWarnings() abort
    let l:counts = luaeval('vim.lsp.diagnostic.get_count(0,"Warning")')
    return l:counts == 0 ? '' : printf("\uf071 %d", l:counts)
endfunction

function! LightlineLSPErrors() abort
    let l:counts = luaeval('vim.lsp.diagnostic.get_count(0,"Error")')
    return l:counts == 0 ? '' : printf("\uf655 %d", l:counts)
endfunction

function! LightlineLSPOk() abort
    let l:total = luaeval("vim.lsp.diagnostic.get_count(0,'Error')") + luaeval("vim.lsp.diagnostic.get_count(0,'Warning')")
    return l:total == 0 ? "\uf42e" : ''
endfunction
