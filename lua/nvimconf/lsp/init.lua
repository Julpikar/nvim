require "nvimconf/lsp/completion"
require "nvimconf/lsp/lspsaga"

-- Load module
local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")

-- lsp_extensions
vim.api.nvim_command(
  'au CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs lua require"lsp_extensions".inlay_hints {prefix=" ", highlight = "Comment", enabled = {"TypeHint","ChainingHint", "ParameterHint"}}'
)

-- register lsp_status
lsp_status.register_progress()

-- Lsp feature attach
local on_attach = function(client, bufnr)
  print("LSP Starting...")
  lsp_status.on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
  print("LSP Okay")
end

local capabilities = lsp_status.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Lsp Integration
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = lsp_status.extensions.clangd.setup()
}

lspconfig.cmake.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true
      },
      staticcheck = true
    }
  },
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.sumneko_lua.setup {
  cmd = {
    "C:\\tools\\precompiled-lua-language-server\\bin\\Windows\\lua-language-server",
    "-E",
    "-e",
    "LANG=en",
    "C:\\tools\\precompiled-lua-language-server\\main.lua"
  },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (LuaJIT in the case of Neovim)
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
      }
    }
  }
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.vimls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}