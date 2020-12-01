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

-- COC
-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.

vimp.inoremap({'silent','expr'}, '<TAB>', 'pumvisible() ? "\\<C-n>" : <SID>check_back_space() ? "\\<TAB>" : coc#refresh()')
vimp.inoremap({'expr'}, '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"')
vim.cmd(
	[===[
		function! s:check_back_space() abort
		    let col = col('.') - 1
		    return !col || getline('.')[col - 1]  =~# '\s'
		endfunction
	]===]
)

-- Use <c-space> to trigger completion.
vimp.inoremap({'silent', 'expr'}, '<c-space>', 'coc#refresh()')

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
vimp.inoremap({'silent', 'expr'}, 'CR', 'pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"')

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vimp.nmap({'silent'}, '[g', '<Plug>(coc-diagnostic-prev)')
vimp.nmap({'silent'}, ']g', '<Plug>(coc-diagnostic-next)')

-- GoTo code navigation.
vimp.nmap({'silent'}, 'gd', '<Plug>(coc-definition)')
vimp.nmap({'silent'}, 'gy', '<Plug>(coc-type-definition)')
vimp.nmap({'silent'}, 'gi', '<Plug>(coc-implementation)')
vimp.nmap({'silent'}, 'gr', '<Plug>(coc-references)')

 -- Use K to show documentation in preview window.
 vimp.nnoremap({'silent'}, 'K', ':call <SID>show_documentation()<CR>')
 vim.cmd(
 	[===[
 		function! s:show_documentation()
		    if (index(['vim','help'], &filetype) >= 0)
		        execute 'h '.expand('<cword>')
		    elseif (coc#rpc#ready())
		        call CocActionAsync('doHover')
		    else
		        execute '!' . &keywordprg . " " . expand('<cword>')
		    endif
		endfunction
 	]===]
 )

 -- Highlight the symbol and its references when holding the cursor.
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")

-- Symbol renaming.
vimp.nmap('<leader>rn', '<Plug>(coc-rename)')

-- Formatting selected code.
vimp.xmap('<leader>f', '<Plug> (coc-format-selected)')
vim.cmd('nmap <leader>f  <Plug>(coc-format-selected)')

vim.cmd(
	[===[
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	]===]
)

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
vimp.xmap('<leader>a', '<Plug> (coc-codeaction-selected)')
vimp.nmap('<leader>a', '<Plug> (coc-codeaction-selected)')

-- Remap keys for applying codeAction to the current buffer.
vim.cmd('nmap <leader>ac  <Plug>(coc-codeaction)')

-- Apply AutoFix to problem on the current line.
vimp.nmap('<leader>qf', '<Plug> (coc-fix-current)')
-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
vimp.xmap('if', '<Plug>(coc-funcobj-i)')
vimp.omap('if', '<Plug>(coc-funcobj-i)')
vimp.xmap('af', '<Plug>(coc-funcobj-a)')
vimp.omap('af', '<Plug>(coc-funcobj-a)')
vimp.xmap('ic', '<Plug>(coc-classobj-i)')
vimp.omap('ic', '<Plug>(coc-classobj-i)')
vimp.xmap('ac', '<Plug>(coc-classobj-a)')
vimp.omap('ac', '<Plug>(coc-classobj-a)')

-- Remap <C-f> and <C-b> for scroll float windows/popups.
-- Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
vimp.nnoremap({'nowait', 'expr'}, '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "\\<C-f>"')
vimp.nnoremap({'nowait', 'expr'}, '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "\\<C-b>"')
vimp.inoremap({'nowait', 'expr'}, '<C-f>', 'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(1)\\<cr>" : "\\<Right>"')
vimp.inoremap({'nowait', 'expr'}, '<C-b>', 'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(0)\\<cr>" : "\\<Left>"')

-- NeoVim-only mapping for visual mode scroll
-- Useful on signatureHelp after jump placeholder of snippet expansion
vimp.vnoremap({'nowait','expr'}, '<C-f>', 'coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\\<C-f>"')
vimp.vnoremap({'nowait','expr'}, '<C-b>', 'coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\\<C-b>"')

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
vim.cmd('nmap <silent> <C-s> <Plug>(coc-range-select)')
vim.cmd('xmap <silent> <C-s> <Plug>(coc-range-select)')

-- Add `:Format` command to format current buffer.
vim.cmd('command! -nargs=0 Format :call CocAction("format")')

-- Add `:Fold` command to fold current buffer.
vim.cmd('command! -nargs=? Fold :call     CocAction("fold", <f-args>)')

-- Add `:OR` command for organize imports of the current buffer.
vim.cmd('command! -nargs=0 OR   :call     CocAction("runCommand", "editor.action.organizeImport")')

-- Mappings for CoCList
-- Show all diagnostics.
vimp.nnoremap({'silent','nowait'}, '<space>a', ':<C-u>CocList diagnostics<cr>')
-- Manage extensions.
vimp.nnoremap({'silent','nowait'}, '<space>e', ':<C-u>CocList extensions<cr>')
-- Show commands.
vimp.nnoremap({'silent','nowait'}, '<space>c', ':<C-u>CocList commands<cr>')
-- Find symbol of current document.
vimp.nnoremap({'silent','nowait'}, '<space>o', ':<C-u>CocList outline<cr>')
-- Search workspace symbols.
vimp.nnoremap({'silent','nowait'}, '<space>s', ':<C-u>CocList -I symbols<cr>')
-- Do default action for next item.
vimp.nnoremap({'silent','nowait'}, '<space>j', ':<C-u>CocNext<CR>')
-- Do default action for previous item.
vimp.nnoremap({'silent','nowait'}, '<space>k', ':<C-u>CocPrev<CR>')
-- Resume latest coc list.
vimp.nnoremap({'silent','nowait'}, '<space>p', ':<C-u>CocListResume<CR>')

vim.cmd(
	[===[
		function! ShowDocIfNoDiagnostic(timer_id)
			if (coc#float#has_float() == 0)
		    	silent call CocActionAsync('doHover')
		  	endif
		endfunction

		function! s:show_hover_doc()
		  	call timer_start(1000, 'ShowDocIfNoDiagnostic')
		endfunction

		autocmd CursorHold * :call <SID>show_hover_doc()
	]===]
)