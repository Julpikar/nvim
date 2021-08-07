local Vista = {}

function Vista.keymap()
  local remap = vim.api.nvim_set_keymap
  remap("n", "<F9>", "<CMD>Vista!!<CR>", {silent = true})
  remap("i", "<F9>", "<CMD>Vista!!<CR>", {silent = true})
  remap("v", "<F9>", "<CMD>Vista!!<CR>", {silent = true})
end

return Vista
