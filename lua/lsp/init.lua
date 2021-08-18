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

local function document_highlight_capabilities(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    api.nvim_exec(
      [[
      hi MReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi MReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi MReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
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

local function common_on_attach(client, bufnr)
  lsp_handlers()
  document_highlight_capabilities(client, bufnr)

  lspstatus.config {
    status_symbol = "",
    diagnostics = false
  }
  lspstatus.register_progress()
  lspstatus.on_attach(client, bufnr)

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
  local lsp = config.lsp
  if lsp_client_active(lsp.provider) then
    return
  end

  local setup = {
    on_attach = common_on_attach,
    capabilities = common_capabilities(),
    autostart = false
  }

  setup = vim.tbl_extend("keep", setup, lsp.setup)

  lspconfig[lsp.provider].setup(setup)
end

return M
