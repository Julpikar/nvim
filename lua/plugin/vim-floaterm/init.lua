local FloatTerm = {}

function FloatTerm.config()
  vim.g.floaterm_width = 0.8
  vim.g.floaterm_height = 0.8
  vim.g.floaterm_autoclose = 1
  vim.g.floaterm_autoinsert = 1
  vim.api.nvim_set_keymap("n", "<F5>", "<CMD>FloatermNew lazygit<CR>", { noremap = true, silent = true })
end

return FloatTerm
