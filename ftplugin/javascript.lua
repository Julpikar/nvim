local config = {
  linters = {},
  lsp = {
    javascript = {provider = "tsserver"}
  }
}

require("lsp").setup(config)
