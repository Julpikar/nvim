local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local api = vim.api

local LSPConfig = {}

local function common_on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Set document highlight on event CursorHold and CursorHoldI
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
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
      sign = "",
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
    { "n", "f", vim.lsp.buf.format, opts },
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

local function list_registered_formatting_source(filetype)
  local s = require("null-ls.sources")
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      if method == null_ls.methods.FORMATTING then
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end
  end
  return registered
end

local function common_on_init(client, bufnr)
  if not client.server_capabilities.document_formatting then
    return
  end
  local client_filetypes = client.config.filetypes or {}
  for _, filetype in ipairs(client_filetypes) do
    if #vim.tbl_keys(list_registered_formatting_source(filetype)) > 0 then
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
    end
  end
end

function LSPConfig.load_settings()
  -- Server setup
  local user_configs = require("lsp.config")

  -- Registering null-ls
  local null_ls_common_config = {
    on_attach = common_on_attach,
    capabilities = common_capabilities(),
  }
  local user_null_ls_setup_config = user_configs.null_ls
  local null_ls_config = {}
  if user_null_ls_setup_config ~= nil then
    null_ls_config = vim.tbl_extend("force", null_ls_common_config, user_null_ls_setup_config)
    null_ls.setup(null_ls_config)
  end

  -- Registering LSP server
  local lsp_common_config = {
    on_attach = common_on_attach,
    on_init = common_on_init,
    capabilities = common_capabilities(),
  }
  for server, config in pairs(user_configs) do
    if server ~= "null_ls" then
      local server_config = {}
      if config ~= nil then
        server_config = vim.tbl_extend("force", lsp_common_config, config)
      end
      lspconfig[server].setup(server_config)
    end
  end

  -- Autoformat
  local delayed_auto_format = function()
    local duration_in_ms = 2000
    vim.lsp.buf.formatting_sync(nil, duration_in_ms)
  end

  api.nvim_create_autocmd("BufWritePost", { callback = delayed_auto_format })
end

return LSPConfig
