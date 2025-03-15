local Illuminate = {

  "RRethy/vim-illuminate",
  event = "VeryLazy",
}
Illuminate.config = function()
  require("illuminate").configure({
    filetypes_denylist = { "NvimTree" },
    modes_denylist = { "v", "vs", "V", "Vs", "CTRL_V", "CTRL_Vs" },
    should_enable = function(bufnr)
      return vim.api.nvim_buf_line_count(bufnr) < 500
    end,
  })

  local set_hl = vim.api.nvim_set_hl

  set_hl(0, "IlluminatedWordText", { bg = "#374145" })
  set_hl(0, "IlluminatedWordRead", { bg = "#374145" })
  set_hl(0, "IlluminatedWordWrite", { bg = "#374145" })
end

return Illuminate
