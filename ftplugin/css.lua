local config = {
  lsp = {
    css = {provider = "cssls"}
  }
}

require("lsp").setup(config)
