local null_ls = require("null-ls")
local config = {
	lsp = {
		css = { provider = "cssls" },
	},
	null_ls = { sources = { null_ls.builtins.formatting.prettier } },
}

require("lsp").setup(config)
