local config = {
  linters = {},
  lsp = {
    provider = "gopls",
    setup = {}
  }
}

require("lsp").setup(config)
