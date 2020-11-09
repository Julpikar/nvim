-- TextEdit might fail if hidden is not set.
vim.o.hidden = true

-- Some servers have issues with backup files, see #649.
vim.g.nobackup = true
vim.g.nowritebackup = true

-- Give more space for displaying messages.
vim.o.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.o.shortmess = vim.o.shortmess..'c'

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
-- " Recently vim can merge signcolumn and number column into one
vim.o.signcolumn = 'yes'

-- Add `:Format` command to format current buffer.
vim.cmd("command! -nargs=0 Format :call CocAction('format')")

-- Add `:Fold` command to fold current buffer.
vim.cmd("command! -nargs=? Fold :call CocAction('fold', <f-args>)")
