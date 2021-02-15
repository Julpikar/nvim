-- Local variable
local api = vim.api

-- Setting leader key
vim.cmd([[let g:mapleader = "\<SPACE>"]])
vim.cmd([[let g:maplocalleader = ',']])

-- Startify
api.nvim_set_keymap("n", "<HOME>", "<CMD>Startify<CR>", {silent = true})
api.nvim_set_keymap("i", "<HOME>", "<CMD>Startify<CR>", {silent = true})
api.nvim_set_keymap("v", "<HOME>", "<CMD>Startify<CR>", {silent = true})

-- Nerdtree
api.nvim_set_keymap("i", "<F2>", "<CMD>NERDTreeFind<CR>", {silent = true})
api.nvim_set_keymap("n", "<F2>", "<CMD>NERDTreeFind<CR>", {silent = true})
api.nvim_set_keymap("v", "<F2>", "<CMD>NERDTreeFind<CR>", {silent = true})

api.nvim_set_keymap("i", "<F3>", "<CMD>NERDTreeToggle<CR>", {silent = true})
api.nvim_set_keymap("n", "<F3>", "<CMD>NERDTreeToggle<CR>", {silent = true})
api.nvim_set_keymap("v", "<F3>", "<CMD>NERDTreeToggle<CR>", {silent = true})

api.nvim_set_keymap("i", "<F4>", "<CMD>NERDTreeToggleVCS<CR>", {silent = true})
api.nvim_set_keymap("n", "<F4>", "<CMD>NERDTreeToggleVCS<CR>", {silent = true})
api.nvim_set_keymap("v", "<F4>", "<CMD>NERDTreeToggleVCS<CR>", {silent = true})

-- Vista
api.nvim_set_keymap("n", "<F9>", "<CMD>Vista!!<CR>", {silent = true})
api.nvim_set_keymap("i", "<F9>", "<CMD>Vista!!<CR>", {silent = true})
api.nvim_set_keymap("v", "<F9>", "<CMD>Vista!!<CR>", {silent = true})

-- auto format
api.nvim_set_keymap("n", "<F10>", ":Format<CR>", {silent = true})
api.nvim_set_keymap("i", "<F10>", ":Format<CR>", {silent = true})
api.nvim_set_keymap("v", "<F10>", ":Format<CR>", {silent = true})

-- LSP
--vimp.nnoremap({'silent'}, '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
--vimp.nnoremap({'silent'}, '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>')
--vimp.nnoremap({'silent'}, 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
--vimp.nnoremap({'silent'}, '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
--vimp.nnoremap({'silent'}, '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
--vimp.nnoremap({'silent'}, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
--vimp.nnoremap({'silent'}, 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
--vimp.nnoremap({'silent'}, 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
--vimp.nnoremap({'silent'}, 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
--vimp.nnoremap('<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
--vimp.nnoremap('<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
--vimp.nnoremap('<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
--vimp.nnoremap('<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
--vimp.nnoremap('<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
--vimp.nnoremap('<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

-- Telescope
api.nvim_set_keymap("n", "<LEADER>ff", "<CMD> lua require ('telescope.builtin').find_files()<CR>", {noremap = true})
api.nvim_set_keymap("n", "<LEADER>fg", "<CMD> lua require ('telescope.builtin').live_grep()<CR>", {noremap = true})
api.nvim_set_keymap("n", "<LEADER>fb", "<CMD> lua require ('telescope.builtin').buffers()<CR>", {noremap = true})
api.nvim_set_keymap("n", "<LEADER>ft", "<CMD> lua require ('telescope.builtin').help_tags()<CR>", {noremap = true})
api.nvim_set_keymap("n", "<LEADER>fs", "<CMD> lua require ('telescope.builtin').treesitter()<CR>", {noremap = true})

---- nvim-compe
--vimp.inoremap({'silent', 'expr'}, '<C-Space>' ,'compe#complete()')
--vimp.inoremap({'silent', 'expr'}, '<CR>'      ,[[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]])
--vimp.inoremap({'silent', 'expr'}, '<C-e>'     ,[['compe#close('<C-e>')]])
--vimp.inoremap({'silent', 'expr'}, '<C-f>'     ,[['compe#scroll({ 'delta': +4 })]])
--vimp.inoremap({'silent', 'expr'}, '<C-d>'     ,[['compe#scroll({ 'delta': -4 })]])
--
-- EasyAlign
-- Start interactive EasyAlign in visual mode (e.g. vipga)
api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {silent = true})

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {silent = true})

---- nvim-luadev
--vimp.nmap({'silent', 'buffer'}, '<leader>n', '<Plug>(Luadev-RunLine)')
--vimp.nmap({'silent', 'buffer'}, '<leader>d', '<Plug>(Luadev-RunWord)')
--vimp.vmap({'silent', 'buffer'}, '<leader>n', '<Plug>(Luadev-Run)')
--vimp.imap({'silent', 'buffer'}, '<leader>u', '<Plug>(Luadev-Complete')
--
---- nvim-toggleterm.lua
--vimp.nnoremap({'silent'}, '<c-t>', [[:<c-u>exe v:count1 . "ToggleTerm"<CR>]])
--vimp.inoremap({'silent'}, '<c-t> <Esc>', [[:<c-u>exe v:count1 . "ToggleTerm"<CR>]])
