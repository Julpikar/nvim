local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local configs = require("lspconfig/configs")
local util = require("lspconfig/util")
local api = vim.api
local Lsp = {}

lsp_status.config(
  {
    status_symbol = "",
    diagnostics = false
  }
)

lsp_status.register_progress()
local capabilities = lsp_status.capabilities

-- compe use LSP snippet
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Disable diagnostic on insert
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- delay update diagnostics
    update_in_insert = false
  }
)

local function on_attach(client, bufnr)
  require("lsp_signature").on_attach()
  lsp_status.on_attach(client, bufnr)

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
    },
    autostart = false
  }
end

function Lsp.config()
  -- Clang
  lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = false
  }

  -- CSS
  configs.css = {
    default_config = {
      cmd = {"node", "C:/tools/vscode/css-language-features/server/dist/node/cssServerMain.js", "--stdio"},
      filetypes = {"css", "less", "scss"},
      root_dir = util.root_pattern(".git", vim.fn.getcwd()),
      init_options = {
        provideFormatter = true
      }
    }
  }

  pcall(
    lspconfig.css.setup,
    {
      on_attach = on_attach,
      capabilities = capabilities,
      autostart = false
    }
  )

  -- CMake
  lspconfig.cmake.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = false
  }

  -- Golang
  lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = false
  }

  -- HTML
  configs.html = {
    default_config = {
      cmd = {"node", "C:/tools/vscode/html-language-features/server/dist/node/htmlServerMain.js", "--stdio"},
      filetypes = {
        -- html
        "aspnetcorerazor",
        "blade",
        "django-html",
        "edge",
        "ejs",
        "eruby",
        "gohtml",
        "haml",
        "handlebars",
        "hbs",
        "html",
        "html-eex",
        "jade",
        "leaf",
        "liquid",
        "markdown",
        "mdx",
        "mustache",
        "njk",
        "nunjucks",
        "php",
        "razor",
        "slim",
        "twig",
        "vue",
        "svelte"
      },
      root_dir = util.root_pattern(".git", vim.fn.getcwd()),
      init_options = {
        provideFormatter = true
      }
    }
  }

  pcall(
    lspconfig.html.setup,
    {
      on_attach = on_attach,
      capabilities = capabilities,
      autostart = false
    }
  )

  -- Intelephense
  lspconfig.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"intelephense.cmd", "--stdio"},
    autostart = false
  }

  -- JSON
  configs.json = {
    default_config = {
      cmd = {"node", "C:/tools/vscode/json-language-features/server/dist/node/jsonServerMain.js", "--stdio"},
      filetypes = {"json"},
      root_dir = util.root_pattern(".git", vim.fn.getcwd()),
      init_options = {
        provideFormatter = true
      }
    }
  }

  pcall(
    lspconfig.json.setup,
    {
      on_attach = on_attach,
      capabilities = capabilities,
      autostart = false
    }
  )

  -- Python
  lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = false
  }

  -- Sumneko
  sumneko_config()
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
