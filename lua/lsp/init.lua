local lspconfig = require("lspconfig")
local api = vim.api

local LSPConfig = {}

local function lsp_client_active(name)
	local clients = vim.lsp.get_active_clients()
	for _, client in pairs(clients) do
		if client.name == name then
			return true
		end
	end
	return false
end

local function common_on_attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Set document highlight on event CursorHold and CursorHoldI
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		local lsp_doc_hi_augroup = api.nvim_create_augroup("LSPDocHighlight", { clear = true })
		api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.schedule(vim.lsp.buf.document_highlight)
			end,
			pattern = "<buffer>",
			group = lsp_doc_hi_augroup,
		})
		api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
			callback = function()
				vim.schedule(vim.lsp.buf.clear_references)
			end,
			pattern = "<buffer>",
			group = lsp_doc_hi_augroup,
		})

		local nvim_set_hl = api.nvim_set_hl
		nvim_set_hl(0, "LspReferenceRead", { fg = "red", bg = "LightYellow", bold = true })
		nvim_set_hl(0, "LspReferenceText", { fg = "red", bg = "LightYellow", bold = true })
		nvim_set_hl(0, "LspReferenceWrite", { fg = "red", bg = "LightYellow", bold = true })
	end

	-- Diagnostic setting
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		signs = true,
	})

	-- Set diagnostic sign
	local groups = {
		err_group = {
			highlight = "DiagnosticSignError",
			sign = "",
		},
		warn_group = {
			highlight = "DiagnosticSignWarn",
			sign = "",
		},
		hint_group = {
			highlight = "DiagnosticSignHint",
			sign = "",
		},
		infor_group = {
			highlight = "DiagnosticSignInfo",
			sign = "",
		},
	}

	for _, group in pairs(groups) do
		vim.fn.sign_define(group.highlight, { text = group.sign, texthl = group.highlight, linehl = "", numhl = "" })
	end

	-- Mappings
	local opts = { buffer = true, noremap = true, silent = true }
	local keymaps = {
		{
			"n",
			"<space>e",
			function()
				vim.diagnostic.open_float()
			end,
			opts,
		},
		{ "n", "[d", vim.diagnostic.goto_prev, opts },
		{ "n", "]d", vim.diagnostic.goto_next, opts },
		{ "n", "q", vim.diagnostic.setloclist, opts },
		{ "n", "gD", vim.lsp.buf.declaration, opts },
		{ "n", "gd", vim.lsp.buf.definition, opts },
		{ "n", "K", vim.lsp.buf.hover, opts },
		{ "n", "gi", vim.lsp.buf.implementation, opts },
		{ "n", "<C-k>", vim.lsp.buf.signature_help, opts },
		{ "n", "wa", vim.lsp.buf.add_workspace_folder, opts },
		{ "n", "wr", vim.lsp.buf.remove_workspace_folder, opts },
		{
			"n",
			"wl",
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			opts,
		},
		{ "n", "D", vim.lsp.buf.type_definition, opts },
		{ "n", "rn", vim.lsp.buf.rename, opts },
		{ "n", "a", vim.lsp.buf.code_action, opts },
		{ "n", "gr", vim.lsp.buf.references, opts },
		{ "n", "f", vim.lsp.buf.formatting, opts },
	}
	local keymap_set = vim.keymap.set
	for _, keymap in pairs(keymaps) do
		keymap_set(unpack(keymap))
	end

	-- document_highlight_capabilities(client)
	require("lsp_signature").on_attach()
end

local function common_capabilities()
	local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local completion_item = capabilities.textDocument.completion.completionItem
	completion_item.documentationFormat = { "markdown" }
	completion_item.snippetSupport = true
	completion_item.preselectSupport = true
	completion_item.insertReplaceSupport = true
	completion_item.labelDetailsSupport = true
	completion_item.deprecatedSupport = true
	completion_item.commitCharactersSupport = true
	completion_item.tagSupport = { valueSet = { 1 } }
	completion_item.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}
	return capabilities
end

function LSPConfig.setup(config)
	-- Common LSP setup
	local lsp_common_config = {
		on_attach = common_on_attach,
		capabilities = common_capabilities(),
		autostart = false,
	}

	-- Registering server
	local lang_servers = config.lsp
	if lang_servers ~= nil then
		for _, server in pairs(lang_servers) do
			if lsp_client_active(server.provider) then
				break
			end

			local server_config = {}
			if server.setup ~= nil then
				server_config = vim.tbl_extend("force", lsp_common_config, server.setup)
			end
			lspconfig[server.provider].setup(server_config)
		end
	end

	-- Registering null-ls
	local null_ls = require("null-ls")
	local null_ls_common_config = {
		on_attach = common_on_attach,
		capabilities = common_capabilities(),
	}
	local null_ls_common_sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.diagnostics.codespell,
	}
	local null_ls_user_config = config.null_ls
	if null_ls_user_config ~= nil then
		null_ls_common_config = vim.tbl_extend("force", null_ls_common_config, null_ls_user_config)

		-- Join null_ls_common_sources
		if null_ls_common_sources ~= nil then
			for i = 1, #null_ls_common_sources do
				null_ls_common_config.sources[#null_ls_common_config.sources + 1] = null_ls_common_sources[i]
			end
		end
		null_ls.setup(null_ls_common_config)

		-- Autoformat
		local delayed_auto_format = function()
			local duration = 500
			vim.defer_fn(vim.lsp.buf.formatting, duration)
		end

		api.nvim_create_autocmd("BufWritePost", { callback = delayed_auto_format })
	end
end

return LSPConfig
