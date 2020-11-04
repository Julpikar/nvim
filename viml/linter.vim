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