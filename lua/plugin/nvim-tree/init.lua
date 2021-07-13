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

local function set_keymap()
  vim.g.nvim_tree_bindings = {
    {key = {"+", "="}, cb = "<CMD>lua require('plugin.nvim-tree').resize('+10')<CR>"},
    {key = {"-"}, cb = "<CMD>lua require('plugin.nvim-tree').resize('-10')<CR>"},
    {key = {"0"}, cb = "<CMD>lua require('plugin.nvim-tree').reset_size()<CR>"}
  }

  local remap = vim.api.nvim_set_keymap
  remap("n", "<F2>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
  remap("n", "<F3>", ":NvimTreeRefresh<CR>", {noremap = true, silent = true})
  remap("n", "<F4>", ":NvimTreeFindFile<CR>", {noremap = true, silent = true})
end

function NvimTree.config()
  local g = vim.g
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_width_allow_resize = 1
  g.nvim_tree_follow = 1
  set_keymap()
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = NvimTree})
    return self
  end
}
setmetatable(NvimTree, metatable)

return NvimTree
