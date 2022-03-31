local packer = require("packer")

local Plugin_manager = {}

local function plugin_init(use)
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")

	-- Editing
	use({
		"Pocco81/TrueZen.nvim",
		cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist" },
		setup = [[require("plugin.truezen").keymap()]],
		config = [[require("plugin.truezen").config()]],
	})
	use("editorconfig/editorconfig-vim")

	use({
		"mg979/vim-visual-multi",
		keys = { { "n", "<C-Up>" }, { "n", "<C-Down>" } },
		setup = [[vim.g.VM_theme = "neon"]],
	})
	use({
		"ntpeters/vim-better-whitespace",
		config = [[require("plugin.whitespace").config()]],
	})
	use({
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
		setup = [[require("plugin.easyalign").keymap()]],
	})
	use("ThePrimeagen/refactoring.nvim")
	-- Comment
	use({ "b3nj5m1n/kommentary", event = "BufRead" })

	-- Dashboard
	use({
		"glepnir/dashboard-nvim",
		setup = function()
			local dashboard = require("plugin.dashboard")
			dashboard.keymap()
			dashboard.setup()
		end,
	})

	-- Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFindFile" },
		setup = [[require("plugin.nvim-tree").keymap()]],
		config = [[require("plugin.nvim-tree").config()]],
	})
	use({
		"airblade/vim-rooter",
		setup = function()
			vim.g.rooter_patterns = { ".git", "Makefile", "*.sln", "build/env.sh" }
			vim.g.rooter_change_directory_for_non_project_files = "current"
		end,
	})

	-- Navigation
	use({
		"phaazon/hop.nvim",
		cmd = { "HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWord" },
		config = [[require("hop").setup({create_hl_autocmd = false})]],
	})
	use({
		"dstein64/nvim-scrollview",
		config = function()
			vim.g.scrollview_excluded_filetypes = {
				"dashboard",
				"Outline",
			}
			vim.g.scrollview_winblend = 10
		end,
	})
	use({
		"kazhala/close-buffers.nvim",
		cmd = { "BDelete", "BWipeout" },
		config = function()
			require("close_buffers").setup({
				preserve_window_layout = { "this" },
				next_buffer_cmd = function(windows)
					require("bufferline").cycle(1)
					local bufnr = vim.api.nvim_get_current_buf()

					for _, window in ipairs(windows) do
						vim.api.nvim_win_set_buf(window, bufnr)
					end
				end,
			})
		end,
	})

	-- Keymap guide
	use({
		"folke/which-key.nvim",
		config = [[require("plugin.whichkey").config()]],
	})

	-- Line
	use({
		"akinsho/nvim-bufferline.lua",
		config = [[require("plugin.bufferline").config()]],
	})
	use({
		"NTBBloodbath/galaxyline.nvim",
		config = [[require("plugin.galaxyline").config()]],
	})

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Git
	use({
		"TimUntersberger/neogit",
		cmd = "Neogit",
		requires = "sindrets/diffview.nvim",
		config = function()
			require("neogit").setup({
				integration = {
					diffview = true,
				},
			})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = [[require("gitsigns").setup {keymaps = {}}]],
	})

	-- Floating terminal
	use({
		"voldikss/vim-floaterm",
		cmd = { "FloatermNew", "FloatermToggle" },
		setup = [[require("plugin.floaterm").setup()]],
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = [[require("plugin.treesitter").config()]],
	})
	use("p00f/nvim-ts-rainbow")

	use({
		"windwp/nvim-ts-autotag",
		ft = { "blade", "html", "tsx", "vue", "svelte", "php" },
		config = [[require("nvim-ts-autotag").setup()]],
	})

	-- Colorizer
	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "html", "javascript", "lua", "typescript" },
		config = [[require("colorizer").setup()]],
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = "ray-x/lsp_signature.nvim",
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		config = [[require("trouble").setup()]],
	})
	use({
		"j-hui/fidget.nvim",
		config = [[require("fidget").setup()]],
	})
	use({
		"simrat39/symbols-outline.nvim",
		config = [[require("plugin.outline").config()]],
	})

	-- Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-vsnip",
			{ "hrsh7th/cmp-nvim-lsp", config = [[require("cmp_nvim_lsp").setup()]] },
			"hrsh7th/cmp-path",
			"hrsh7th/vim-vsnip",
			"rafamadriz/friendly-snippets",
		},
		config = [[require("plugin.cmp").config()]],
	})

	-- Code runner
	use({
		"CRAG666/code_runner.nvim",
		config = [[require("plugin.runner").config()]],
	})

	-- AutoPair
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = [[require("plugin.autopairs").config()]],
	})

	-- Interacting with databases
	use({
		"kristijanhusak/vim-dadbod-ui",
		cmd = "DBUIToggle",
		requires = {
			{ "tpope/vim-dadbod", cmd = "DBUIToggle" },
			{
				"kristijanhusak/vim-dadbod-completion",
				cmd = "DBUIToggle",
			},
		},
		setup = function()
			vim.g.db_ui_show_database_icon = 1
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	})

	-- Debugger
	use({
		"mfussenegger/nvim-dap",
		keys = "<F5>",
		requires = {
			{
				"theHamsta/nvim-dap-virtual-text",
				keys = "<F5>",
				config = [[vim.g.dap_virtual_text = true]],
			},
		},
		config = [[require("plugin.nvim-dap").config()]],
	})

	use({
		"rcarriga/nvim-dap-ui",
		keys = "<F5>",
		config = [[require("dapui").setup()]],
	})
	use({
		"nvim-telescope/telescope-dap.nvim",
		after = { "nvim-dap", "telescope.nvim" },
		config = [[require("telescope").load_extension("dap")]],
	})

	-- Lua Debugger
	use({
		"jbyuki/one-small-step-for-vimkind",
		keys = "<F5>",
		ft = "lua",
	})

	-- Golang
	use({
		"crispgm/nvim-go",
		ft = "go",
		config = [[require("plugin.nvim-go").config()]],
	})

	-- CMake
	use({ "ilyachur/cmake4vim", cmd = { "CMake", "CCMake" } })

	-- Lua Repl
	use({ "rafcamlet/nvim-luapad", cmd = { "Luapad" } })
end

function Plugin_manager.load_plugins()
	packer.init({
		max_jobs = 1,
		git = { clone_timeout = 300 },
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
		profile = {
			enable = true,
			threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
		},
	})
	return packer.startup(plugin_init)
end

return Plugin_manager
