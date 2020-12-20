-- Load module
local completion = require('completion')
local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')

-- Completion setting
vim.o.completeopt = 'menuone,noinsert'
vim.g.completion_enable_auto_paren = 1
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.sorting = 'alphabet'
vim.g.completion_matching_smart_case = 1
vim.g.matching_strategy_list = {'exact', 'fuzzy', 'substring'}
vim.g.completion_auto_change_source = 1
vim.g.completion_customize_lsp_label = {
    Function = '',
    Method = '',
    Reference = '',
    Keyword = '',
    Variable = '',
    Folder = '',
    Snippet = '',
    Buffer = '龎',
    Operator = '',
    Module = '',
    Text = '',
    Class = '',
    Interface = '',
}
vim.g.completion_chain_complete_list = {
		default = {
			{complete_items = {'buffer','lsp', 'snippet'}},
      {mode = 'file'}
        },
		comment = {},
		string = {}
}

vim.g.completion_confirm_key = ""
vim.cmd([[imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"]])

-- Use completion-nvim in every buffer
vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess..'c'

-- Diagnostic setting
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Enable underline, use default values
        underline = true,
        -- Enable virtual text, override spacing to 4
        virtual_text = {
            spacing = 4,
            prefix = '~',
        },
        -- Use a function to dynamically turn signs off
        -- and on, using buffer local variables
        signs = function(bufnr)
            local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
            -- No buffer local variable set, so just enable by default
            if not ok then
                return true
            end

            return result
        end,
        -- Disable a feature
        update_in_insert = false,
    }
)

vim.cmd([[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]])
vim.cmd([[sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=]])
vim.cmd([[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]])
vim.cmd([[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]])

vim.g.cursorhold_updatetime = 1500
vim.cmd(
    [===[
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
local border_chars            = {
	TOP_LEFT                  = '┌',
	TOP_RIGHT                 = '┐',
	MID_HORIZONTAL            = '─',
	MID_VERTICAL              = '│',
    BOTTOM_RIGHT              = '┘',
}
vim.g.lsp_utils_location_opts = {
	height                    = 24,
	mode                      = 'editor',
	preview                   = {
		title                 = 'Location Preview',
		border                = true,
		border_chars          = border_chars
	},
	keymaps                   = {
		n                     = {
			['<C-n>']         = 'j',
			['<C-p>']         = 'k',
		}
	}
}
vim.g.lsp_utils_symbols_opts  = {
	height                    = 24,
	mode                      = 'editor',
	preview                   = {
		title                 = 'Symbols Preview',
		border                = true,
		border_chars          = border_chars
	},
	keymaps                   = {
		n                     = {
			['<C-n>']         = 'j',
			['<C-p>']         = 'k',
		}
	}
}

vim.lsp.callbacks['textDocument/codeAction']     = require'lsputil.codeAction'.code_action_handler
vim.lsp.callbacks['textDocument/references']     = require'lsputil.locations'.references_handler
vim.lsp.callbacks['textDocument/definition']     = require'lsputil.locations'.definition_handler
vim.lsp.callbacks['textDocument/declaration']    = require'lsputil.locations'.declaration_handler
vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.callbacks['workspace/symbol']            = require'lsputil.symbols'.workspace_handler

lsp_status.register_progress()

-- Lsp feature attach
local on_attach = function(client, bufnr)
  	print('LSP Starting...')
    lsp_status.on_attach(client, bufnr)
    completion.on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    print('LSP Okay')
end

-- Lsp Integration
lspconfig.clangd.setup{
    on_attach    = on_attach,
    capabilities = lsp_status.capabilities,
    handlers     = lsp_status.extensions.clangd.setup()
}

lspconfig.cmake.setup{
    on_attach    = on_attach,
    capabilities = lsp_status.capabilities
}

lspconfig.cssls.setup{
    on_attach    = on_attach,
    capabilities = lsp_status.capabilities
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
    on_attach = on_attach
}

lspconfig.html.setup {
    on_attach    = on_attach,
    capabilities = {lsp_status.capabilities, textDocument = {completion = {completionItem = {snippetSupport = true}}}};
}

lspconfig.pyright.setup {
    on_attach    = on_attach,
    capabilities = lsp_status.capabilities
}

lspconfig.rust_analyzer.setup {
    on_attach    = on_attach,
    capabilities = lsp_status.capabilities
}

lspconfig.sumneko_lua.setup {
    cmd = { "C:\\tools\\precompiled-lua-language-server\\bin\\Windows\\lua-language-server",
            "-E", "-e", "LANG=en",
            "C:\\tools\\precompiled-lua-language-server\\main.lua"},
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}

lspconfig.tsserver.setup {
    on_attach    = on_attach,
    capabilities = lsp_status.capabilities,
}

lspconfig.vimls.setup{
    on_attach = on_attach,
    capabilities = {lsp_status.capabilities,
    textDocument = {completion = {completionItem = {snippetSupport = true}}}};
}
