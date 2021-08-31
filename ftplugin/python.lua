local config = {
  linters = {},
  lsp = {
    python = {provider = "pyright"}
  }
}

require("lsp").setup(config)
