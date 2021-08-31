local config = {
  linters = {},
  lsp = {
    json = {provider = "jsonls"}
  }
}

require("lsp").setup(config)
