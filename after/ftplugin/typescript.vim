let b:ale_linters = ['eslint']
let b:ale_fixers = ['prettier', 'eslint']

autocmd FileType typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc