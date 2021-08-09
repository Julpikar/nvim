local lsp = require("lsp")

local sumneko_root_path = "C:/tools/sumneko"
local sumneko_binary = sumneko_root_path .. "/bin/Windows/lua-language-server"

lsp.sumneko_lua.setup {
  on_attach = lsp.common_on_attach,
  capabilities = lsp.common_capabilities(),
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
