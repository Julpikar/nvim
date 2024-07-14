local NvimTree = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
}

local set_size = function(size)
  local view = require("nvim-tree.view")
  view.View.width = size
  view.resize()
end

local resize = function(size)
  local width = tonumber(size) + vim.api.nvim_win_get_width(0)
  set_size(width)
end

local reset_size = function(size)
  local default_width = 30
  set_size(default_width)
end

NvimTree.opts = {
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    -- OR use all default mappings
    api.config.mappings.default_on_attach(bufnr)
  end,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  view = {
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = function()
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
      end,
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  filters = { git_ignored = true },
}

local function opts(desc)
  return {
    desc = "nvim-tree: " .. desc,
    buffer = bufnr,
    noremap = true,
    silent = true,
    nowait = true,
  }
end

NvimTree.keys = {
  { "<F2>", "<CMD>NvimTreeToggle<CR>" },
  { "<F3>", "<CMD>NvimTreeRefresh<CR>" },
  {
    "=",
    function()
      resize(10)
    end,
    opts("Expand Window"),
  },
  {
    "-",
    function()
      resize(-10)
    end,
    opts("Shrink Window"),
  },
  {
    "0",
    function()
      reset_size()
    end,
    opts("Reset Window"),
  },
}

return NvimTree
