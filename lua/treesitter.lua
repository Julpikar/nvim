require'nvim-treesitter.configs'.setup {
	highlight = {
    	enable = true,
    	use_languagetree = false, -- Use this to enable language injection (this is very unstable)
  	},

  	incremental_selection = {
    	enable = true,
    	keymaps = {
	      	init_selection = "gnn",
	      	node_incremental = "grn",
	      	scope_incremental = "grc",
	      	node_decremental = "grm",
    	},
  	},

	indent = {
		enable = true
	}
}
