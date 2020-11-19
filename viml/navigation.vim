" NerdTree
let g:NERDTreeDirArrowExpandable = '╰▸'
let g:NERDTreeDirArrowCollapsible = '├▸'
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1
let NERDTreeNodeDelimiter="😀"
let g:NERDTreeGitStatusIndicatorMapCustom = {
	\'Modified'  :'✹',
	\'Staged'    :'✚',
	\'Untracked' :'✭',
	\'Renamed'   :'➜',
	\'Unmerged'  :'═',
	\'Deleted'   :'✖',
	\'Dirty'     :'✗',
	\'Ignored'   :'☒',
	\'Clean'     :'✔︎',
	\'Unknown'   :'?',
	\}

let g:NERDTreeGitStatusUseNerdFonts = 1

" Startify
let g:startify_lists = [
	\{ 'type': 'files',     'header': ['   Files']},
	\{ 'type': 'dir',       'header': ['   Current Directory '. getcwd()]},
	\{ 'type': 'sessions',  'header': ['   Sessions']},
	\{ 'type': 'bookmarks', 'header': ['   Bookmarks']},
	\]

let g:startify_bookmarks = [
	\{'Config':"~\AppData\Local\nvim\init.vim"},
	\]

let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1

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
