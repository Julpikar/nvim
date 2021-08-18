local config = {
  linters = {},
  lsp = {
    provider = "tsserver",
    setup = {}
  }
}

require("lsp").setup(config)
