local config = {
	lsp = {
		go = { provider = "gopls" },
	},
}

require("lsp").setup(config)
