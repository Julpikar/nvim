local null_ls = require("null-ls")

local user_config = {}

-- Lua LSP config
user_config.lua = {
	provider = "sumneko_lua",
	setup = {
		cmd = { "C:/tools/sumneko/bin/Windows/lua-language-server", "-E", "C:/tools/sumneko/main.lua" },
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
					maxPreload = 100000,
					preloadFileSize = 1000,
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
		autostart = true,
	},
	null_ls = { sources = { null_ls.builtins.formatting.stylua } },
}

-- Python LSP config
user_config.python = {
	provider = "pyright",
	null_ls = {
		sources = {
			null_ls.builtins.formatting.black,
			null_ls.builtins.diagnostics.flake8,
		},
	},
}

-- Rust LSP config
user_config.rust = {
	provider = "rls",
}

return user_config
