local config = {
  lsp = {
    javascript = {provider = "tsserver"}
  }
}

require("lsp").setup(config)
