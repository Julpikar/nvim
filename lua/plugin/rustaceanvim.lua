local Rustaceanvim = {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" },
}

local custom_on_attach = function(client, bufnr)
  local config = {
    bind = true,
    handler_opts = {
      border = "rounded",
    },
  }
  require("lsp_signature").on_attach(config, bufnr)
end

local custom_capabilities = require("cmp_nvim_lsp").default_capabilities()

Rustaceanvim.config = function()
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
