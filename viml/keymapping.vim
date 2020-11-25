" Nerdtree
nnoremap <silent><F2> :NERDTreeFind<CR>
inoremap <silent><F2> :NERDTreeFind<CR>
vnoremap <silent><F2> :NERDTreeFind<CR>

nnoremap <silent><F3> :NERDTreeToggle<CR>
inoremap <silent><F3> :NERDTreeToggle<CR>
vnoremap <silent><F3> :NERDTreeToggle<CR>

nnoremap <silent><F4> :NERDTreeToggleVCS<CR>
inoremap <silent><F4> :NERDTreeToggleVCS<CR>
vnoremap <silent><F4> :NERDTreeToggleVCS<CR>

" Startify
nnoremap <silent><home> :Startify<CR>
inoremap <silent><home> :Startify<CR>
vnoremap <silent><home> :Startify<CR>

nnoremap <silent><F9> :Vista!!<CR>
inoremap <silent><F9> :Vista!!<CR>
vnoremap <silent><F9> :Vista!!<CR>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
" Change an option
nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
nnoremap <Leader>c <cmd>lua require'telescope.builtin'.treesitter{}<CR>

" Neovim builtin LSP
" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
