local null_ls = require("null-ls")
local config = {
	lsp = {
		c = { provider = "clangd" },
	},
	null_ls = { sources = { null_ls.builtins.formatting.clang_format } },
}

require("lsp").setup(config)
