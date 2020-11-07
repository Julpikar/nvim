vim.cmd(
    [===[
        function! GitStatus()
            let [a,m,r] = GitGutterGetHunkSummary()
            return printf('+%d ~%d -%d', a, m, r)
        endfunction
    ]===]
)
vim.g.gitgutter_sign_added = '✚'
vim.g.gitgutter_sign_modified = ''
vim.g.gitgutter_sign_removed = '❌'
vim.g.gitgutter_sign_removed_first_line = '﫿'
vim.g.gitgutter_sign_removed_above_and_below = '祈'
vim.g.gitgutter_sign_modified_removed = ''
vim.g.gitgutter_async = true
