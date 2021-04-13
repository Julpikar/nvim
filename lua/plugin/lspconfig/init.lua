local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local api = vim.api
local Lsp = {}

lsp_status.config(
  {
    status_symbol = "•",
    diagnostics = false
  }
)

lsp_status.register_progress()
local capabilities = lsp_status.capabilities

-- compe use LSP snippet
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(client, bufnr)
  lsp_status.on_attach(client, bufnr)

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings.
  local opts = {noremap = true, silent = true}
  local keymaps = {
    {"n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>"},
    {"n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>"},
    {"n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>"},
    {"n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>"},
    {"n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>"},
    {"n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>"},
    {"n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>"},
    {"n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>"},
    {"n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>"},
    {"n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>"},
    {"n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>"},
    {"n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"},
    {"n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"},
    {"n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"},
    {"n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>"}
  }

  for _, keymap in ipairs(keymaps) do
    buf_set_keymap(keymap[1], keymap[2], keymap[3], opts)
  end

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

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

local function sumneko_config()
  -- Sumneko Lua
  local system_name
  if vim.fn.has("mac") == 1 then
    system_name = "macOS"
  elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
  elseif vim.fn.has("win32") == 1 then
    system_name = "Windows"
  else
    print("Unsupported system for sumneko")
  end

  -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
  local sumneko_root_path = "C:/tools/sumneko"
  local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

  lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = vim.split(package.path, ";")
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {"vim"}
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false
        }
      }
    }
  }
end

function Lsp.config()
  -- Intelephense
  lspconfig.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities
  }

  -- Rust Analyzer
  lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities
  }

  -- Sumneko
  sumneko_config()

  -- Vimls
  lspconfig.vimls.setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Lsp})
    return self
  end
}
setmetatable(Lsp, metatable)

return Lsp
