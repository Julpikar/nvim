require"toggleterm".setup{
        size            = vim.fn.winwidth(0)*0.5,
        open_mapping    = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        persist_size    = true,
        direction       = 'vertical'
    }

vim.cmd([[autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <C-\><C-n>:exe v:count1 . "ToggleTerm"<CR>]])
