-- Load Vimpeccable
local vimp = require 'vimp'

-- Nerdtree
vimp.inoremap({'silent'}, '<F2>', ':NERDTreeFind<CR>')
vimp.nnoremap({'silent'}, '<F2>', ':NERDTreeFind<CR>')
vimp.vnoremap({'silent'}, '<F2>', ':NERDTreeFind<CR>')

vimp.inoremap({'silent'}, '<F3>', ':NERDTreeToggle<CR>')
vimp.nnoremap({'silent'}, '<F3>', ':NERDTreeToggle<CR>')
vimp.vnoremap({'silent'}, '<F3>', ':NERDTreeToggle<CR>')


vimp.inoremap({'silent'}, '<F4>', ':NERDTreeToggleVCS<CR>')
vimp.nnoremap({'silent'}, '<F4>', ':NERDTreeToggleVCS<CR>')
vimp.vnoremap({'silent'}, '<F4>', ':NERDTreeToggleVCS<CR>')

-- Startify
vimp.nnoremap({'silent'}, '<home>', ':Startify<CR>')
vimp.inoremap({'silent'}, '<home>', ':Startify<CR>')
vimp.vnoremap({'silent'}, '<home>', ':Startify<CR>')

-- Vista
vimp.nnoremap({'silent'}, '<F9>', ':Vista!!<CR>')
vimp.inoremap({'silent'}, '<F9>', ':Vista!!<CR>')
vimp.vnoremap({'silent'}, '<F9>', ':Vista!!<CR>')

-- Telescope
vimp.nnoremap('<leader>ff', '<CMD> lua require (\'telescope.builtin\').find_files()<CR>')
vimp.nnoremap('<leader>fg', '<CMD> lua require (\'telescope.builtin\').live_grep()<CR>')
vimp.nnoremap('<leader>fb', '<CMD> lua require (\'telescope.builtin\').buffers()<CR>')
vimp.nnoremap('<leader>ft', '<CMD> lua require (\'telescope.builtin\').help_tags()<CR>')
vimp.nnoremap('<Leader>c', '<CMD> lua require (\'telescope.builtin\').treesitter{}<CR>')

-- LSP
vimp.nnoremap({'silent'}, '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
vimp.nnoremap({'silent'}, '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>')
vimp.nnoremap({'silent'}, 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vimp.nnoremap({'silent'}, '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
vimp.nnoremap({'silent'}, '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vimp.nnoremap({'silent'}, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vimp.nnoremap({'silent'}, 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
vimp.nnoremap({'silent'}, 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
vimp.nnoremap({'silent'}, 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vimp.nnoremap('<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
vimp.nnoremap('<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
vimp.nnoremap('<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
vimp.nnoremap('<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vimp.nnoremap('<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
vimp.nnoremap('<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

-- EasyAlign
-- Start interactive EasyAlign in visual mode (e.g. vipga)
vimp.xmap('ga', '<Plug>(EasyAlign)')

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vimp.nmap('ga', '<Plug>(EasyAlign)')

-- nvim-luadev
vimp.nmap({'silent', 'buffer'}, '<leader>n', '<Plug>(Luadev-RunLine)')
vimp.nmap({'silent', 'buffer'}, '<leader>d', '<Plug>(Luadev-RunWord)')
vimp.vmap({'silent', 'buffer'}, '<leader>n', '<Plug>(Luadev-Run)')
vimp.imap({'silent', 'buffer'}, '<leader>u', '<Plug>(Luadev-Complete')

-- nvim-toggleterm.lua
vimp.nnoremap({'silent'}, '<c-t>', [[:<c-u>exe v:count1 . "ToggleTerm"<CR>]])
vimp.inoremap({'silent'}, '<c-t> <Esc>', [[:<c-u>exe v:count1 . "ToggleTerm"<CR>]])
