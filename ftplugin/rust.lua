local config = {
  linters = {},
  lsp = {
    rust = {provider = "rust_analyzer"}
  }
}

require("lsp").setup(config)