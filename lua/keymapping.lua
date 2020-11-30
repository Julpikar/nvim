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

-- Neovim builtin LSP
-- Code navigation shortcuts
vimp.nnoremap({'silent'}, '<c-]>', '<CMD>lua vim.lsp.buf.definition()<CR>')
vimp.nnoremap({'silent'}, 'K', '<CMD>lua vim.lsp.buf.hover()<CR>')
vimp.nnoremap({'silent'}, 'gD', '<CMD>lua vim.lsp.buf.implementation()<CR>')
vimp.nnoremap({'silent'}, '<c-k>', '<CMD>lua vim.lsp.buf.signature_help()<CR>')
vimp.nnoremap({'silent'}, '1gD', '<CMD>lua vim.lsp.buf.type_definition()<CR>')
vimp.nnoremap({'silent'}, 'gr', '<CMD>lua vim.lsp.buf.references()<CR>')
vimp.nnoremap({'silent'}, 'g0', '<CMD>lua vim.lsp.buf.document_symbol()<CR>')
vimp.nnoremap({'silent'}, 'gW', '<CMD>lua vim.lsp.buf.workspace_symbol()<CR>')
vimp.nnoremap({'silent'}, 'gd', '<CMD>lua vim.lsp.buf.declaration()<CR>')
vimp.nnoremap({'silent'}, 'ga', '<CMD>lua vim.lsp.buf.code_action()<CR>')
