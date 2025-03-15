local Gitsign = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  config = true,
}

Gitsign.init = function()
  local set_hl = vim.api.nvim_set_hl
  set_hl(0, "GitSignsAdd", { fg = "#a7c080", bg = "#2e383c" })
  set_hl(0, "GitSignsChange", { fg = "#7fbbb3", bg = "#2e383c" })
  set_hl(0, "GitSignsDelete", { fg = "#e67e80", bg = "#2e383c" })
  set_hl(0, "GitSignsAddNr", { fg = "#a7c080" })
  set_hl(0, "GitSignsChangeNr", { fg = "#7fbbb3" })
  set_hl(0, "GitSignsDeleteNr", { fg = "#e67e80" })
  set_hl(0, "GitSignsAddLn", { fg = "#3c4841" })
  set_hl(0, "GitSignsChangeLn", { fg = "#384b55" })
  set_hl(0, "GitSignsCurrentLineBlame", { fg = "#859289" })
end

return Gitsign
