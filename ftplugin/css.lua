local config = {
  linters = {},
  lsp = {
    css = {provider = "cssls"}
  }
}

require("lsp").setup(config)
