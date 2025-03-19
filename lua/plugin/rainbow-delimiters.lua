local Delimiters = {
  "HiPhish/rainbow-delimiters.nvim",
}

Delimiters.init = function()
  local set_hl = vim.api.nvim_set_hl

  set_hl(0, "RainbowDelimiterRed", { fg = "#e67e80" })
  set_hl(0, "RainbowDelimiterYellow", { fg = "#dbbc7f" })
  set_hl(0, "RainbowDelimiterBlue", { fg = "#7fbbb3" })
  set_hl(0, "RainbowDelimiterOrange", { fg = "#e69875" })
  set_hl(0, "RainbowDelimiterGreen", { fg = "#a7c080" })
  set_hl(0, "RainbowDelimiterViolet", { fg = "#d699b6" })
  set_hl(0, "RainbowDelimiterCyan", { fg = "#83c092" })
end

return Delimiters
