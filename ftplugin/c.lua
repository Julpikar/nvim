local config = {
  lsp = {
    c = {provider = "clangd"}
  }
}

require("lsp").setup(config)
