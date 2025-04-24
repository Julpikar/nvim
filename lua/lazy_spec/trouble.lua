local Trouble = {
  "folke/trouble.nvim",
  opts = {},
}

Trouble.keys = {
  {
    "<leader>xs",
    "<cmd>Trouble diagnostics toggle<cr>",
    desc = "Trouble: Diagnostics",
  },
  {
    "<leader>xd",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    desc = "Trouble: Buffer Diagnostics",
  },
  {
    "<leader>cs",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    desc = "Trouble: Symbols",
  },
  {
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "Trouble: LSP Definitions / references / ...",
  },
  {
    "<leader>xl",
    "<cmd>Trouble loclist toggle<cr>",
    desc = "Trouble: Location List",
  },
  {
    "<leader>xq",
    "<cmd>Trouble qflist toggle<cr>",
    desc = "Trouble: Quickfix List",
  },
}

return Trouble
