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
  keys = { { "<LEADER>gn", "<CMD>Neogit<CR>" } },
}

Neogit.init = function()
  local set_hl = vim.api.nvim_set_hl

  set_hl(0, "NeogitObjectId", { fg = "#d699b6" })
  set_hl(0, "NeogitBranch", { fg = "#e69875", bold = true })
  set_hl(0, "NeogitRemote", { fg = "#e76f91", bold = true })
  set_hl(0, "NeogitDiffAdd", { fg = "#1e2326", bg = "#83c092" })
  set_hl(0, "NeogitDiffAddHighlight", { fg = "#1e2326", bg = "#a7c080" })
  set_hl(0, "NeogitDiffDelete", { fg = "#1e2326", bg = "#e69875" })
  set_hl(0, "NeogitDiffDeleteHighlight", { fg = "#1e2326", bg = "#e67e80" })
  set_hl(0, "NeogitUnstagedchanges", { fg = "#e67e80" })
  set_hl(0, "NeogitStagedchanges", { fg = "#a7c080" })
  set_hl(0, "NeogitUnmergedInto", { fg = "#dbbc7f" })
  set_hl(0, "NeogitRecentcommits", { fg = "#7fbbb3" })
  set_hl(0, "NeogitChangeModified", { fg = "#dbbc7f" })
  set_hl(0, "NeogitChangeAdded", { fg = "#83c092" })
  set_hl(0, "NeogitChangeDeleted", { fg = "#e69875" })
end

return Neogit
