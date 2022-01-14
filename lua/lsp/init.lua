local lspconfig = require("lspconfig")
local lspstatus = require("lsp-status")
local api = vim.api

local function lsp_client_active(name)
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    if client.name == name then
      return true
    end
  end
  return false
end

local function document_highlight_capabilities(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_diagnostic_sign()
  local group = {
    err_group = {
      highlight = "LspDiagnosticsSignError",
      sign = ""
    },
    warn_group = {
      highlight = "LspDiagnosticsSignWarning",
      sign = ""
    },
    hint_group = {
      highlight = "LspDiagnosticsSignHint",
      sign = ""
    },
    infor_group = {
      highlight = "LspDiagnosticsSignInformation",
      sign = ""
    }
  }

  for _, g in pairs(group) do
    vim.fn.sign_define(g.highlight, {text = g.sign, texthl = g.highlight, linehl = "", numhl = ""})
  end
end

local function lsp_handlers()
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      update_in_insert = false,
      severity_sort = true
    }
  )
end

local function lsp_status(client, bufnr)
  lspstatus.config {
    status_symbol = "",
    diagnostics = false
  }
  lspstatus.register_progress()
  lspstatus.on_attach(client, bufnr)
end

local function lsp_keymaps(bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap("n", "s", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "d", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "e", "<cmd>lua vim.lsp.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local function common_on_attach(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_handlers()
  lsp_diagnostic_sign()
  document_highlight_capabilities(client)
  lsp_status(client, bufnr)
  require("lsp_signature").on_attach()
end

local function common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.documentationFormat = {"markdown"}
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits"
    }
  }
  capabilities = vim.tbl_extend("keep", capabilities or {}, lspstatus.capabilities)
  return capabilities
end

local M = {}

function M.setup(config)
  local list_lsp = config.lsp
  for _, lsp in pairs(list_lsp) do
    if lsp_client_active(lsp.provider) then
      return
    end

    local setup = {
      on_attach = common_on_attach,
      capabilities = common_capabilities(),
      autostart = false
    }

    if lsp.setup ~= nil then
      setup = vim.tbl_extend("force", setup, lsp.setup)
    end

    lspconfig[lsp.provider].setup(setup)
  end
end

return M
