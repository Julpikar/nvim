local compe = require "compe"
local lspkind = require "lspkind"
-- Completion setting
vim.o.completeopt = "menu,menuone,noselect"
compe.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "always",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    snippets_nvim = true,
    treesitter = true
  }
}
-- vim-vsnip
vim.g.vsnip_snippet_dir = vim.fn.expand("~/AppData/Local/nvim/snippets")

-- Add vscode-like pictograms
lspkind.init()