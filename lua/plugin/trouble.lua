local Trouble = {
  "folke/trouble.nvim",
  event = "VeryLazy",
  config = true,
  cmd = "Trouble",
}

Trouble.init = function()
  local set_hl = vim.api.nvim_set_hl

  set_hl(0, "TroubleSource", { fg = "#859289" })
  set_hl(0, "TroubleCode", { fg = "#859289" })
  set_hl(0, "TroubleText", { fg = "#d3c6aa" })
end

Trouble.keys = {
  {
    "<leader>xs",
    "<cmd>Trouble diagnostics toggle<cr>",
    desc = "Diagnostics (Trouble)",
  },
  {
    "<leader>xd",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    desc = "Buffer Diagnostics (Trouble)",
  },
  {
    "<leader>cs",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    desc = "Symbols (Trouble)",
  },
  {
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "LSP Definitions / references / ... (Trouble)",
  },
  {
    "<leader>xl",
    "<cmd>Trouble loclist toggle<cr>",
    desc = "Location List (Trouble)",
  },
  {
    "<leader>xq",
    "<cmd>Trouble qflist toggle<cr>",
    desc = "Quickfix List (Trouble)",
  },
}

return Trouble
