local config = {
  lsp = {
    svelte = {provider = "svelte"}
  }
}

require("lsp").setup(config)
