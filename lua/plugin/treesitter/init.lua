local Treesitter = {}

function Treesitter.config()
  -- TreeSitter config
  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true
    },
    rainbow = {
      enable = true,
      extended_mode = true -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    }
  }

  -- Folding
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()]]"
  vim.opt.foldlevel = 99
end

return Treesitter
