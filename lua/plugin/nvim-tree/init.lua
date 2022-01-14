local NvimTree = {}

local function resize(size)
  local view = require("nvim-tree.view")
  view.View.width = size
  view.resize()
end

function NvimTree.resize(size)
  local width = tonumber(size) + vim.api.nvim_win_get_width(0)
  resize(width)
end

function NvimTree.reset_size()
  local default_width = 30
  resize(default_width)
end

function NvimTree.keymap()
  local remap = vim.api.nvim_set_keymap
  remap("n", "<F2>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
  remap("n", "<F3>", ":NvimTreeRefresh<CR>", {noremap = true, silent = true})
  remap("n", "<F4>", ":NvimTreeFindFile<CR>", {noremap = true, silent = true})
end

function NvimTree.config()
  require "nvim-tree".setup {
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = true,
    -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    update_cwd = true,
    view = {
      -- if true the tree will resize itself after opening a file
      auto_resize = true,
      mappings = {
        -- list of mappings to set on the tree manually
        list = {
          {key = {"+", "="}, cb = "<CMD>lua require('plugin.nvim-tree').resize('+10')<CR>"},
          {key = {"-"}, cb = "<CMD>lua require('plugin.nvim-tree').resize('-10')<CR>"},
          {key = {"0"}, cb = "<CMD>lua require('plugin.nvim-tree').reset_size()<CR>"}
        }
      }
    }
  }
end

return NvimTree
