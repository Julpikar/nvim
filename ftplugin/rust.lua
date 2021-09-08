local config = {
  linters = {},
  lsp = {
    rust = {provider = "rls"}
  }
}

require("lsp").setup(config)
