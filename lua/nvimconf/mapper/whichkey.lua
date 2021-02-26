-- Setting leader key
vim.cmd([[let g:mapleader = "\<SPACE>"]])
vim.cmd([[let g:maplocalleader = ',']])

vim.g.which_key_use_floating_win = 1
local api = vim.api

api.nvim_set_keymap("n", "<leader>", ":<c-u>WhichKey '<Space>'<CR>", {silent = true})
api.nvim_set_keymap("n", "<localleader>", ":<c-u>WhichKey  ','<CR>", {silent = true})

local which_key_map = {}
which_key_map["w"] = {
  name = "+windows",
  w = {
    "<C-W>w",
    "other-window"
  }
}

vim.fn["which_key#register"]("<Space>", which_key_map)
