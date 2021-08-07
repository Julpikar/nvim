local lspconfig = require("lspconfig")
local lspstatus = require("lsp-status")

local api = vim.api

local Lsp = {}

local lsp = {
  completion = {
    item_kind = {
      Text = "  ",
      Method = "  ",
      Function = "  ",
      Constructor = "  ",
      Field = " ﴲ ",
      Variable = "[]",
      Class = "  ",
      Interface = " ﰮ ",
      Module = "  ",
      Property = " 襁",
      Unit = "  ",
      Value = "  ",
      Enum = " 練",
      Keyword = "  ",
      Snippet = "  ",
      Color = "  ",
      File = "  ",
      Reference = "  ",
      Folder = "  ",
      EnumMember = "  ",
      Constant = " ﲀ ",
      Struct = " ﳤ ",
      Event = "  ",
      Operator = "  ",
      TypeParameter = "  "
    },
    item_order = {
      "Text",
      "Method",
      "Function",
      "Constructor",
      "Field",
      "Variable",
      "Class",
      "Interface",
      "Module",
      "Property",
      "Unit",
      "Value",
      "Enum",
      "Keyword",
      "Snippet",
      "Color",
      "File",
      "Reference",
      "Folder",
      "EnumMember",
      "Constant",
      "Struct",
      "Event",
      "Operator",
      "TypeParameter"
    }
  },
  diagnostic = {
    signs = {
      active = true,
      values = {
        {name = "LspDiagnosticsSignError", text = ""},
        {name = "LspDiagnosticsSignWarning", text = ""},
        {name = "LspDiagnosticsSignHint", text = ""},
        {name = "LspDiagnosticsSignInformation", text = ""}
      }
    },
    virtual_text = {
      prefix = "",
      spacing = 0
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true
  }
}

lspstatus.config {
  status_symbol = "",
  diagnostics = false
}

lspstatus.register_progress()

local function completion_item_kind()
  local symbol_map = lsp.completion.item_kind
  local symbols = {}
  local len = 25

  for i = 1, len do
    local name = lsp.completion.item_order[i]
    local symbol = symbol_map[name]
    symbol = symbol and (symbol .. " ") or ""
    symbols[i] = string.format("%s%s", symbol, name)
  end

  vim.lsp.protocol.CompletionItemKind = symbols
end

local function document_highlight_capabilities(client, bufnr)
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

local function lsp_handlers()
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      update_in_insert = lsp.diagnostic.update_in_insert -- Disable diagnostic on insert
    }
  )
end

function Lsp.common_on_attach(client, bufnr)
  require("lsp_signature").on_attach()
  lspstatus.on_attach(client, bufnr)
  lsp_handlers()
  completion_item_kind()
  document_highlight_capabilities(client, bufnr)
end

function Lsp.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
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

local metatable = {
  __index = function(self, server)
    return lspconfig[server]
  end
}

setmetatable(Lsp, metatable)

return Lsp
