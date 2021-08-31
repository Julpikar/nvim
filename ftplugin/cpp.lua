local config = {
  linters = {},
  lsp = {
    cpp = {provider = "clangd"}
  }
}

require("lsp").setup(config)
