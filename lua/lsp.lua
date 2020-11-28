local vimp = require('vimp')
local lsp_status = require('lsp-status')
local completion = require('completion')
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

vim.o.completeopt = 'menuone,noinsert'

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess..'c'

vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.diagnostic_show_sign = 1

vim.g.completion_enable_auto_paren = 1
vim.g.completion_enable_snippet = 'UltiSnips'

vimp.inoremap({'expr'},'<CR>',[[pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]])

-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
vim.o.updatetime = 300

function _G.diagnostic_or_doc()
    if not vim.tbl_isempty(vim.lsp.buf_get_clients()) then
        if not vim.tbl_isempty(vim.lsp.diagnostic.get_line_diagnostics()) then
            vim.lsp.diagnostic.show_line_diagnostics()
        else
            vim.wait(1000,vim.lsp.buf.hover())
        end
    end
end

-- Show diagnostic popup on cursor hold
vim.cmd('autocmd CursorHold * lua diagnostic_or_doc()')
vim.cmd(
    [===[
    function! LspStatus() abort
        if luaeval('#vim.lsp.buf_get_clients() > 0')
            return luaeval("require('lsp-status').status()")
        endif
        return ''
    endfunction

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    " Enable type inlay hints
    autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
        \ lua require'lsp_extensions'.inlay_hints{
            \ prefix = '>> ',
            \ highlight = "Comment",
            \ aligned = true,
            \ only_current_line = false
        \}
    ]===]
)

--  RishabhRD/nvim-lsputils theme
local border_chars = {
	TOP_LEFT = '┌',
	TOP_RIGHT = '┐',
	MID_HORIZONTAL = '─',
	MID_VERTICAL = '│',
	BOTTOM_LEFT = '└',
	BOTTOM_RIGHT = '┘',
}
vim.g.lsp_utils_location_opts = {
	height = 24,
	mode = 'editor',
	preview = {
		title = 'Location Preview',
		border = true,
		border_chars = border_chars
	},
	keymaps = {
		n = {
			['<C-n>'] = 'j',
			['<C-p>'] = 'k',
		}
	}
}
vim.g.lsp_utils_symbols_opts = {
	height = 24,
	mode = 'editor',
	preview = {
		title = 'Symbols Preview',
		border = true,
		border_chars = border_chars
	},
	keymaps = {
		n = {
			['<C-n>'] = 'j',
			['<C-p>'] = 'k',
		}
	}
}

vim.lsp.callbacks['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.callbacks['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.callbacks['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.callbacks['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.callbacks['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

local on_attach = function(client, bufnr)
  	lsp_status.on_attach(client, bufnr)
    completion.on_attach(client, bufnr)
end

lsp_status.register_progress()
lsp_status.config({
    status_symbol = '',
    indicator_errors = 'E',
    indicator_warnings = 'W',
    indicator_info = 'I',
    indicator_hint = 'H',
    indicator_ok = '',
    spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})

lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
}

lspconfig.gopls.setup {
    cmd = {'gopls', 'serve'},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
}
