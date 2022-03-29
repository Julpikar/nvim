local config = {
  lsp = {
    lua = {
      provider = "sumneko_lua",
      setup = {
        cmd = {"C:/tools/sumneko/bin/Windows/lua-language-server", "-E", "C:/tools/sumneko/main.lua"},
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
              },
              maxPreload = 100000,
              preloadFileSize = 1000
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false
            }
          }
        },
        autostart = true
      }
    }
  }
}

require("lsp").setup(config)
