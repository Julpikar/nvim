local FloatTerm = {}

function FloatTerm.config()
  vim.g.floaterm_width = 0.8
  vim.g.floaterm_height = 0.8
  vim.g.floaterm_autoclose = 1
  vim.g.floaterm_autoinsert = 1
  vim.keymap.set("n", "<F5>", "<CMD>FloatermNew lazygit<CR>")
  vim.keymap.set("n", "<F6>", "<CMD>FloatermNew --cwd=<root><CR>")
  vim.keymap.set("n", "<F7>", "<CMD>FloatermNew --cwd=<buffer><CR>")
end

return FloatTerm
