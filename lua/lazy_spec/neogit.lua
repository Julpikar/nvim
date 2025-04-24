local Neogit = {
  "NeogitOrg/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
  },
  opts = {
    signs = {
      -- { CLOSED, OPENED }
      hunk = { "", "" },
      item = { "󰧂", "󰦿" },
      section = { "󰧂", "󰦿" },
    },
  },
  keys = { { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit: Open" } },
}

return Neogit
