local config = {
  formatters = {
    {
      -- @usage can be gofmt or goimports or gofumpt
      exe = "",
      args = {},
      stdin = true
    }
  },
  linters = {},
  lsp = {
    provider = "gopls",
    setup = {}
  }
}

require("lsp").setup(config)
