vim.g.ale_set_balloons = 1
vim.g.ale_disable_lsp = 1
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = '✘'
vim.g.ale_sign_warning = '⚠'
vim.cmd('highlight ALEErrorSign ctermbg=NONE ctermfg=red cterm=underline')
vim.cmd('highlight alewarningsign ctermbg=none ctermfg=yellow cterm=underline')
