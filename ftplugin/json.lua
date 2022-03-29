local config = {
  lsp = {
    json = {provider = "jsonls"}
  }
}

require("lsp").setup(config)
