local Gonvim = {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
  },
  ft = { "go", "gomod" },
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

Gonvim.opts = {
  lsp_cfg = {
    capabilities = custom_capabilities,
  },
  lsp_on_attach = custom_on_attach,
}

return Gonvim
