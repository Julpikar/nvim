local Gonvim = {}

function Gonvim.config()
  local custom_on_attach = function(client, bufnr)
    local config = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    }
    require("lsp_signature").on_attach(config, bufnr)
  end

  local custom_capabilities = require("cmp_nvim_lsp").default_capabilities()

  require("go").setup({
    lsp_cfg = {
      capabilities = custom_capabilities,
    },
    lsp_on_attach = custom_on_attach,
  })
end

return Gonvim
