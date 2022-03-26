local Outline = {}

function Outline.config()
  local keymap_set = vim.keymap.set
  keymap_set("n", "<F9>", "<CMD>SymbolsOutline<CR>", {silent = true})
  keymap_set("i", "<F9>", "<CMD>SymbolsOutline<CR>", {silent = true})
  keymap_set("v", "<F9>", "<CMD>SymbolsOutline<CR>", {silent = true})
end

return Outline
