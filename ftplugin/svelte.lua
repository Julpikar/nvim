local config = {
  linters = {},
  lsp = {
    svelte = {provider = "svelte"}
  }
}

require("lsp").setup(config)
