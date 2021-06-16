local Tree = {}

local function set_keymap()
  local remap = vim.api.nvim_set_keymap
  remap("n", "<F2>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
  remap("n", "<F3>", ":NvimTreeRefresh<CR>", {noremap = true, silent = true})
  remap("n", "<F4>", ":NvimTreeFindFile<CR>", {noremap = true, silent = true})
end

function Tree.config()
  vim.g.nvim_tree_width = 50
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_width_allow_resize = 1
  vim.g.nvim_tree_hijack_cursor = 0
  set_keymap()
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Tree})
    return self
  end
}
setmetatable(Tree, metatable)

return Tree
