local config = {
  linters = {},
  lsp = {
    provider = "rust_analyzer",
    setup = {}
  }
}

require("lsp").setup(config)
