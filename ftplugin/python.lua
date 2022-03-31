local null_ls = require("null-ls")

local config = {
	lsp = {
		python = { provider = "pyright" },
	},
	null_ls = {
		sources = {
			null_ls.builtins.formatting.black,
			null_ls.builtins.diagnostics.flake8,
		},
	},
}

require("lsp").setup(config)
