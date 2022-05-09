local null_ls = require("null-ls")

local user_config = {}
-- Null-ls config
user_config.null_ls = {
  sources = {
    null_ls.builtins.code_actions.gitsigns.with({
      disabled_filetypes = { "NvimTree" },
    }),
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.flake8,
  },
}

-- Clangd
user_config.clangd = {
  autostart = false,
}

-- CMake
user_config.cmake = {
  autostart = false,
}

-- Gopls LSP config
user_config.gopls = {
  autostart = false,
}

-- Json LSP config
user_config.jsonls = {}

-- Lua LSP config
user_config.sumneko_lua = {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 1000,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Python LSP config
user_config.pyright = {
  autostart = false,
}

-- Rust LSP config
user_config.rls = {
  autostart = false,
}

return user_config
