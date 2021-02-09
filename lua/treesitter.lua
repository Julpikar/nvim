require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    use_languagetree = true, -- Use this to enable language injection (this is very unstable)
  },

  refactor = {
    highlight_definitions = { enable = true },
    --highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },

  navigation = {
    enable = true,
    keymaps = {
      goto_definition = "gnd",
      list_definitions = "gnD",
      list_definitions_toc = "gO",
      goto_next_usage = "<a-*>",
      goto_previous_usage = "<a-#>",
    },
  },

  rainbow = {
    enable = true,
    disable = {'bash'} -- please disable bash until I figure #1 out
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
  --indent = {
  --    enable = true
  --}
}

vim.g.foldmethod = 'expr'
vim.g.foldexpr = 'nvim_treesitter#foldexpr()'
