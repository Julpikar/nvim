vim.g.ale_disable_lsp = 1
vim.g.ale_set_balloons = 1
vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_delay = 300
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_column_always = 1
vim.g.ale_sign_error = '✘'
vim.g.ale_sign_warning = '⚠'
vim.cmd('highlight ALEErrorSign ctermbg=none cterm=underline')
vim.cmd('highlight alewarningsign ctermbg=none cterm=underline')
