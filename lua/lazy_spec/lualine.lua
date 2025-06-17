local Lualine = {
  "nvim-lualine/lualine.nvim",
}

local colors = {
  bg_c = "#343f44",
  bg_b = "#475258",
  inactive = "#2D353B",
  fg = "#d3c6aa",
  yellow = "#dbbc7f",
  purple = "#d699b6",
  red = "#e67e80",
  blue = "#7fbbb3",
  grey = "#9da9a0",
  orange = "#e69875",
}

local theme = {
  normal = {
    a = { bg = colors.orange, fg = colors.bg_c, gui = "bold" },
    b = { bg = colors.bg_b, fg = colors.fg },
    c = { bg = colors.bg_c, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.bg_c, gui = "bold" },
    b = { bg = colors.bg_b, fg = colors.fg },
    c = { bg = colors.bg_c, fg = colors.fg },
  },
  visual = {
    a = { bg = colors.purple, fg = colors.bg_c, gui = "bold" },
    b = { bg = colors.bg_b, fg = colors.fg },
    c = { bg = colors.bg_c, fg = colors.fg },
  },
  replace = {
    a = { bg = colors.red, fg = colors.bg_c, gui = "bold" },
    b = { bg = colors.bg_b, fg = colors.fg },
    c = { bg = colors.bg_c, fg = colors.fg },
  },
  command = {
    a = { bg = colors.yellow, fg = colors.bg_c, gui = "bold" },
    b = { bg = colors.bg_b, fg = colors.fg },
    c = { bg = colors.bg_c, fg = colors.fg },
  },
  terminal = {
    a = { bg = colors.grey, fg = colors.bg_c, gui = "bold" },
    b = { bg = colors.bg_b, fg = colors.grey },
    c = { bg = colors.bg_c, fg = colors.fg },
  },
  inactive = {
    a = { bg = colors.inactive, fg = colors.inactive },
    b = { bg = colors.inactive, fg = colors.inactive },
    c = { bg = colors.inactive, fg = colors.inactive },
  },
}
local function shorten_path(path, sep, max_len)
  local len = #path
  if len <= max_len then
    return path
  end

  local segments = vim.split(path, sep)
  for idx = 1, #segments - 1 do
    if len <= max_len then
      break
    end

    local segment = segments[idx]
    local shortened = segment:sub(1, vim.startswith(segment, ".") and 2 or 1)
    segments[idx] = shortened
    len = len - (#segment - #shortened)
  end

  return table.concat(segments, sep)
end

local function provider_cwd()
  local root = require("config.rooter")
  local path, _ = root.find_lsp_root() or root.find_pattern_root()
  if path ~= nil then
    local shortened_path = shorten_path(path, "/", 40)
    return shortened_path
  else
    return ""
  end
end

local function buffer_not_empty()
  return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
end

local function hide_in_width()
  return vim.fn.winwidth(0) > 120
end

Lualine.opts = {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 500,
      tabline = 9999,
      winbar = 9999,
    },
  },
  sections = {
    lualine_a = {
      { provider_cwd, separator = { right = "" }, cond = hide_in_width },
    },
    lualine_b = {
      { "mode", separator = { right = "" } },
    },
    lualine_c = {},
    lualine_x = {
      {
        "lsp_status",
        icon = "",
        symbols = { done = "", separator = " 󰇙 " },
        separator = "󰇙",
        color = { fg = colors.orange },
      },
      { "diagnostics", symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" }, separator = "󰇙" },
      { "branch", icon = "branch:", separator = "󰇙", color = { fg = colors.orange } },
      { "diff", separator = "󰇙", cond = hide_in_width },
      {
        "location",
        separator = "󰇙",
        cond = function()
          return buffer_not_empty() or hide_in_width()
        end,
        color = { fg = "#d699b6" },
      },
      {
        "progress",
        separator = "󰇙",
        cond = function()
          return buffer_not_empty() or hide_in_width()
        end,
        color = { fg = "#d699b6" },
      },
      { "fileformat" },
    },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "fzf", "lazy", "mason", "nvim-dap-ui", "overseer", "trouble" },
}

return Lualine
