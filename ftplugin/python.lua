local null_ls = require("null-ls")

local config = {
  lsp = {
    python = {provider = "pyright"}
  }
}

require("lsp").setup(config)
