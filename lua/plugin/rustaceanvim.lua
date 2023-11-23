local custom_on_attach = require("lsp_signature").on_attach
local custom_capabilities = require("cmp_nvim_lsp").default_capabilities

local Rustaceanvim = {}

function Rustaceanvim.config()
  vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {},
    -- LSP configuration
    server = {
      on_attach = custom_on_attach,
      capabilities = custom_capabilities(),
    },
    -- DAP configuration
    dap = {},
  }
end

return Rustaceanvim
