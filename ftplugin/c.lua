local config = {
  linters = {},
  lsp = {
    c = {provider = "clangd"}
  }
}

require("lsp").setup(config)
