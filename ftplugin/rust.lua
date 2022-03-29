local config = {
  lsp = {
    rust = {provider = "rls"}
  }
}

require("lsp").setup(config)
