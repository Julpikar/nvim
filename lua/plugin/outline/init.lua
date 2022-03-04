local Outline = {}

function Outline.config()
  local remap = vim.api.nvim_set_keymap
  remap("n", "<F9>", "<CMD>SymbolsOutline<CR>", {silent = true})
  remap("i", "<F9>", "<CMD>SymbolsOutline<CR>", {silent = true})
  remap("v", "<F9>", "<CMD>SymbolsOutline<CR>", {silent = true})
end

return Outline
