" Nerdtree
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
nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<CR>
nnoremap <Leader>c <cmd>lua require'telescope.builtin'.treesitter{}<CR>

" Lsp
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

" Trigger completion with <Tab>
inoremap <silent><expr> <TAB>
 	\ pumvisible() ? "\<C-n>" :
  	\ <SID>check_back_space() ? "\<TAB>" :
  	\ completion#trigger_completion()
