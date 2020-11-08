" Vim-go
let g:go_gopls_enabled = 0

" AutoImport
autocmd BufWritePre * call CocAction('runCommand', 'editor.action.organizeImport')
