local lspconfig = require("lspconfig")
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
    local lsp_doc_hi_augroup = api.nvim_create_augroup("LSPDocHighlight", {clear = true})
    api.nvim_create_autocmd(
      "CursorHold",
      {
        callback = function()
          vim.schedule(vim.lsp.buf.document_highlight)
        end,
        pattern = "<buffer>",
        group = lsp_doc_hi_augroup
      }
    )
    api.nvim_create_autocmd(
      "CursorMoved",
      {
        callback = function()
          vim.schedule(vim.lsp.buf.clear_references)
        end,
        pattern = "<buffer>",
        group = lsp_doc_hi_augroup
      }
    )

    local nvim_set_hl = api.nvim_set_hl
    nvim_set_hl(0, "LspReferenceRead", {ctermbg = "red", bg = "LightYellow", bold = true})
    nvim_set_hl(0, "LspReferenceText", {ctermbg = "red", bg = "LightYellow", bold = true})
    nvim_set_hl(0, "LspReferenceWrite", {ctermbg = "red", bg = "LightYellow", bold = true})
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

local function lsp_keymaps(bufnr)
  -- Enable completion triggered by <c-x><c-o>
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  local opts = {buffer = bufnr, noremap = true, silent = true}
  local keymaps = {
    {
      "n",
      "<space>e",
      function()
        vim.diagnostic.open_float()
      end,
      opts
    },
    {"n", "[d", vim.diagnostic.goto_prev, opts},
    {"n", "]d", vim.diagnostic.goto_next, opts},
    {"n", "q", vim.diagnostic.setloclist, opts},
    {"n", "gD", vim.lsp.buf.declaration, opts},
    {"n", "gd", vim.lsp.buf.definition, opts},
    {"n", "K", vim.lsp.buf.hover, opts},
    {"n", "gi", vim.lsp.buf.implementation, opts},
    {"n", "<C-k>", vim.lsp.buf.signature_help, opts},
    {"n", "wa", vim.lsp.buf.add_workspace_folder, opts},
    {"n", "wr", vim.lsp.buf.remove_workspace_folder, opts},
    {
      "n",
      "wl",
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      opts
    },
    {"n", "D", vim.lsp.buf.type_definition, opts},
    {"n", "rn", vim.lsp.buf.rename, opts},
    {"n", "a", vim.lsp.buf.code_action, opts},
    {"n", "gr", vim.lsp.buf.references, opts},
    {"n", "f", vim.lsp.buf.formatting, opts}
  }
  local keymap_set = vim.keymap.set
  for _, keymap in pairs(keymaps) do
    keymap_set(unpack(keymap))
  end
end

local function common_on_attach(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_handlers()
  lsp_diagnostic_sign()
  document_highlight_capabilities(client)
  require("lsp_signature").on_attach()
end

local function common_capabilities()
  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local completion_item = capabilities.textDocument.completion.completionItem
  completion_item.documentationFormat = {"markdown"}
  completion_item.snippetSupport = true
  completion_item.preselectSupport = true
  completion_item.insertReplaceSupport = true
  completion_item.labelDetailsSupport = true
  completion_item.deprecatedSupport = true
  completion_item.commitCharactersSupport = true
  completion_item.tagSupport = {valueSet = {1}}
  completion_item.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits"
    }
  }
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
