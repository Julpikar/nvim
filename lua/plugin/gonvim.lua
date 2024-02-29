local Gonvim = {}

function Gonvim.config()
  local custom_on_attach = require("lsp_signature").on_attach
  local custom_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  require("go").setup({
    lsp_cfg = {
      capabilities = custom_capabilities,
    },
    lsp_on_attach = custom_on_attach,
  })
end

return Gonvim
