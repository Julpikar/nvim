local NVIMTree = {}

local function resize(size)
  local view = require("nvim-tree.view")
  view.View.width = size
  view.resize()
end

function NVIMTree.resize(size)
  local width = tonumber(size) + vim.api.nvim_win_get_width(0)
  resize(width)
end

function NVIMTree.reset_size()
  local default_width = 30
  resize(default_width)
end
local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- copy default mappings here from defaults in next section
  -- vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  -- vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  ---
  -- OR use all default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- remove a default
  -- vim.keymap.del('n', '<C-]>', { buffer = bufnr })

  -- override a default
  -- vim.keymap.set('n', '<C-e>', api.tree.reload,                       opts('Refresh'))

  -- add your mappings
end

function NVIMTree.config()
  require("nvim-tree").setup({
    on_attach = on_attach,
  })
  -- vim.keymap.set('n', '<C-e>', api.tree.reload,                       opts('Refresh'))

  -- add your mappings
  local keymap_set = vim.keymap.set
  keymap_set("n", "<F2>", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true })
  keymap_set("n", "<F3>", "<CMD>NvimTreeRefresh<CR>", { noremap = true, silent = true })
end

return NVIMTree
