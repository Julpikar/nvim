local NvimTree = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
}

NvimTree.init = function()
  local set_hl = vim.api.nvim_set_hl

  set_hl(0, "NvimTreeSymlink", { fg = "#d3c6aa" })
  set_hl(0, "NvimTreeExecFile", { fg = "#d3c6aa" })
  set_hl(0, "NvimTreeOpenedFile", { fg = "#d3c6aa" })
  set_hl(0, "NvimTreeSpecialFile", { fg = "#d3c6aa" })
  set_hl(0, "NvimTreeImageFile", { fg = "#d3c6aa" })
  set_hl(0, "NvimTreeFolderName", { fg = "#a7c080" })
  set_hl(0, "NvimTreeEmptyFolderName", { fg = "#a7c080" })
  set_hl(0, "NvimTreeOpenedFolderName", { fg = "#a7c080" })
  set_hl(0, "NvimTreeSymlinkFolderName", { fg = "#a7c080" })
  set_hl(0, "NvimTreeRootFolder", { fg = "#859289" })
  set_hl(0, "NvimTreeFolderIcon", { fg = "#e69875" })
  set_hl(0, "NvimTreeIndentMarker", { fg = "#859289" })
  set_hl(0, "NvimTreeNormal", { fg = "#d3c6aa", bg = "#272e33" })
  set_hl(0, "NvimTreeNormalFloat", { fg = "#d3c6aa", bg = "#272e33" })
  set_hl(0, "NvimTreeNormalNC", { link = "NormalFloat" })
  set_hl(0, "NvimTreeWinSeparator", { fg = "#272e33", bg = "#272e33" })
  set_hl(0, "NvimTreeCursorLine", { bg = "#272e33" })
  set_hl(0, "NvimTreeGitDirty", { fg = "#dbbc7f" })
  set_hl(0, "NvimTreeGitStaged", { fg = "#7fbbb3" })
  set_hl(0, "NvimTreeGitMerge", { fg = "#e69875" })
  set_hl(0, "NvimTreeGitRenamed", { fg = "#d699b6" })
  set_hl(0, "NvimTreeGitNew", { fg = "#83c092" })
  set_hl(0, "NvimTreeGitDeleted", { fg = "#e67e80" })
  set_hl(0, "NvimTreeLspDiagnosticsError", { fg = "#e67e80", bg = "#2e383c" })
  set_hl(0, "NvimTreeLspDiagnosticsWarning", { fg = "#dbbc7f", bg = "#2e383c" })
  set_hl(0, "NvimTreeLspDiagnosticsInformation", { fg = "#7fbbb3", bg = "#2e383c" })
  set_hl(0, "NvimTreeLspDiagnosticsHint", { fg = "#a7c080", bg = "#2e383c" })
end

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
