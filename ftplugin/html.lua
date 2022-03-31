local null_ls = require("null-ls")
local config = {
	lsp = {
		html = { provider = "html" },
		tailwindcss = { provider = "tailwindcss" },
	},
	null_ls = { sources = { null_ls.builtins.formatting.prettier } },
}

require("lsp").setup(config)
