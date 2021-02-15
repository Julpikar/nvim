-- Load module
local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local compe = require("compe")
local lspkind = require("lspkind")

-- Completion setting
vim.o.completeopt = "menu,menuone,noselect"
compe.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "always",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    snippets_nvim = true,
    treesitter = true
  }
}
-- vim-vsnip
vim.g.vsnip_snippet_dir = vim.fn.expand("~/AppData/Local/nvim/snippets")

-- Add vscode-like pictograms
lspkind.init()

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

-- Diagnostic setting
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = "~"
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, "show_signs")
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,
    -- Disable a feature
    update_in_insert = false
  }
)

vim.cmd([[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]])
vim.cmd([[sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=]])
vim.cmd([[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]])
vim.cmd([[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]])

vim.api.nvim_command(
  'au CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs lua require"lsp_extensions".inlay_hints {prefix=" ", highlight = "Comment", enabled = {"TypeHint","ChainingHint", "ParameterHint"}}'
)

--  RishabhRD/nvim-lsputils theme
local border_chars = {
  TOP_LEFT = "┌",
  TOP_RIGHT = "┐",
  MID_HORIZONTAL = "─",
  MID_VERTICAL = "│",
  BOTTOM_RIGHT = "┘"
}
vim.g.lsp_utils_location_opts = {
  height = 24,
  mode = "editor",
  preview = {
    title = "Location Preview",
    border = true,
    border_chars = border_chars
  },
  keymaps = {
    n = {
      ["<C-n>"] = "j",
      ["<C-p>"] = "k"
    }
  }
}
vim.g.lsp_utils_symbols_opts = {
  height = 24,
  mode = "editor",
  preview = {
    title = "Symbols Preview",
    border = true,
    border_chars = border_chars
  },
  keymaps = {
    n = {
      ["<C-n>"] = "j",
      ["<C-p>"] = "k"
    }
  }
}

vim.lsp.callbacks["textDocument/codeAction"] = require "lsputil.codeAction".code_action_handler
vim.lsp.callbacks["textDocument/references"] = require "lsputil.locations".references_handler
vim.lsp.callbacks["textDocument/definition"] = require "lsputil.locations".definition_handler
vim.lsp.callbacks["textDocument/declaration"] = require "lsputil.locations".declaration_handler
vim.lsp.callbacks["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
vim.lsp.callbacks["textDocument/implementation"] = require "lsputil.locations".implementation_handler
vim.lsp.callbacks["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler
vim.lsp.callbacks["workspace/symbol"] = require "lsputil.symbols".workspace_handler

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
