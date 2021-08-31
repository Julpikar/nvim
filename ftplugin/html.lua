local config = {
  linters = {},
  lsp = {
    html = {provider = "html"},
    tailwindcss = {provider = "tailwindcss"}
  }
}

require("lsp").setup(config)
