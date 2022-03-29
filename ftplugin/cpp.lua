local config = {
  lsp = {
    cpp = {provider = "clangd"}
  }
}

require("lsp").setup(config)
