local custom_capabilities = require("cmp_nvim_lsp").default_capabilities()
local custom_on_attach = function(client, bufnr)
  local config = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded",
    },
  }
  require("lsp_signature").on_attach(config, bufnr)
end

local Rustaceanvim = {}

function Rustaceanvim.config()
  vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {},
    -- LSP configuration
    server = {
      on_attach = custom_on_attach,
      capabilities = custom_capabilities,
    },
    -- DAP configuration
    dap = {},
  }
end

return Rustaceanvim
