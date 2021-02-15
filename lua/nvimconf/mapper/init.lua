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

-- Lspsaga.nvim
-- lsp provider to find the cursor word definition and reference
api.nvim_set_keymap("n", "gh", " <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {silent = true})
-- code action
api.nvim_set_keymap("n", "ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {silent = true})
api.nvim_set_keymap("n", "ca", "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>", {silent = true})
-- show hover doc
api.nvim_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", {silent = true})
-- scroll down hover doc or scroll in definition preview
api.nvim_set_keymap("n", "<C-f>", " <cmd>lua require('lspsaga.hover').smart_scroll_with_saga(1)<CR>", {silent = true})
-- scroll up hover doc
api.nvim_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.hover').smart_scroll_with_saga(-1)<CR>", {silent = true})
-- show signature help
api.nvim_set_keymap("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", {silent = true})
-- rename
api.nvim_set_keymap("n", "gr", "<cmd>lua require('lspsaga.rename').rename()<CR>", {silent = true})
-- preview definition
api.nvim_set_keymap("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", {silent = true})
-- show diagnostic
api.nvim_set_keymap(
  "n",
  "<leader>cd",
  "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
  {silent = true}
)
-- jump diagnostic
api.nvim_set_keymap("n", "[e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", {silent = true})
api.nvim_set_keymap("n", "]e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", {silent = true})
-- float terminal also you can pass the cli command in open_float_terminal function
api.nvim_set_keymap("n", "<A-d>", "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", {silent = true})
api.nvim_set_keymap(
  "t",
  "<A-d>",
  "<C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>",
  {silent = true}
)

-- Telescope
api.nvim_set_keymap("n", "<LEADER>ff", "<CMD> lua require ('telescope.builtin').find_files()<CR>", {noremap = true})
api.nvim_set_keymap("n", "<LEADER>fg", "<CMD> lua require ('telescope.builtin').live_grep()<CR>", {noremap = true})
api.nvim_set_keymap("n", "<LEADER>fb", "<CMD> lua require ('telescope.builtin').buffers()<CR>", {noremap = true})
api.nvim_set_keymap("n", "<LEADER>ft", "<CMD> lua require ('telescope.builtin').help_tags()<CR>", {noremap = true})
api.nvim_set_keymap("n", "<LEADER>fs", "<CMD> lua require ('telescope.builtin').treesitter()<CR>", {noremap = true})

-- nvim-compe
api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {silent = true, expr = true})
api.nvim_set_keymap(
  "i",
  "<CR>",
  "compe#confirm({ 'keys': '<Plug>delimitMateCR', 'mode': '' })",
  {silent = true, expr = true}
)
api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {silent = true, expr = true})
api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {silent = true, expr = true})
api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {silent = true, expr = true})

-- EasyAlign
-- Start interactive EasyAlign in visual mode (e.g. vipga)
api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {silent = true})

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {silent = true})

-- nvim-luadev
api.nvim_set_keymap("n", "<leader>n", "<Plug>(Luadev-RunLine)", {"silent", "buffer"})
api.nvim_set_keymap("n", "<leader>n", "<Plug>(Luadev-Run)", {"silent", "buffer"})
api.nvim_set_keymap("n", "<leader>d", "<Plug>(Luadev-RunWord)", {"silent", "buffer"})
api.nvim_set_keymap("n", "<leader>u", "<Plug>(Luadev-Complete", {"silent", "buffer"})

-- nvim-toggleterm.lua
api.nvim_set_keymap("n", "<c-t>", ":<c-u>exe v:count1 . 'ToggleTerm'<CR>", {"silent"})
api.nvim_set_keymap("n", "<c-t> <Esc>", ":<c-u>exe v:count1 . 'ToggleTerm'<CR>", {"silent"})
