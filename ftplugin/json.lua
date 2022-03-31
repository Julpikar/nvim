local null_ls = require("null-ls")
local config = {
	lsp = {
		json = { provider = "jsonls" },
	},
	null_ls = { sources = { null_ls.builtins.formatting.prettier } },
}

require("lsp").setup(config)
