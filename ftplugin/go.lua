local config = {
  linters = {},
  lsp = {
    go = {provider = "gopls"}
  }
}

require("lsp").setup(config)
