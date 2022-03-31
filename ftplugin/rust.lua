local null_ls = require("null-ls")
local config = {
	lsp = {
		rust = { provider = "rls" },
	},
	null_ls = { sources = { null_ls.builtins.formatting.rustfmt } },
}

require("lsp").setup(config)
