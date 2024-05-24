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

  -- add your mappings
  vim.keymap.set("n", "=", "<CMD>lua require('plugin.nvim-tree-lua').resize('+10')<CR>", opts("Expand Window"))
  vim.keymap.set("n", "-", "<CMD>lua require('plugin.nvim-tree-lua').resize('-10')<CR>", opts("Shrink Window"))
  vim.keymap.set("n", "0", "<CMD>lua require('plugin.nvim-tree-lua').reset_size()CR>", opts("Reset Window"))
end

local function float_win_config()
  local col = vim.opt.columns:get()
  local line = vim.opt.lines:get()

  local width = (col * 0.8) > 80 and 80 or 40
  local height = (col * 0.8) > 30 and 30 or 20

  local ccol = (col - width) / 2
  local cline = (line - height) / 2

  return {
    relative = "editor",
    border = "rounded",
    width = width,
    height = height,
    row = cline,
    col = ccol,
  }
end
function NVIMTree.config()
  require("nvim-tree").setup({
    on_attach = on_attach,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    view = {
      float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = function()
          return float_win_config()
        end,
      },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    filters = { git_ignored = true },
  })

  -- add your mappings
  vim.keymap.set("n", "<F2>", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<F3>", "<CMD>NvimTreeRefresh<CR>", { noremap = true, silent = true })
end

return NVIMTree
