vim.loader.enable({ enable = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("colorscheme theme")

require("config.option")
require("config.keymap")
require("config.lazy")
