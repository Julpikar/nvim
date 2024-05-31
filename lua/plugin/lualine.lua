local lualine = require("lualine")

local Lualine = {}

local function theme()
  return {
    normal = {
      a = { bg = "#2e383c", fg = "#859289" },
      b = { bg = "#414b50", fg = "#9da9a0" },
      c = { bg = "#1e2326", fg = "#a7c080", gui = "bold" },
    },
    insert = {
      a = { bg = "#2e383c", fg = "#d3c6aa" },
      b = { bg = "#414b50", fg = "#d3c6aa" },
      c = { bg = "#1e2326", fg = "#d3c6aa", gui = "bold" },
    },
    visual = {
      a = { bg = "#2e383c", fg = "#d3c6aa" },
      b = { bg = "#414b50", fg = "#d3c6aa" },
      c = { bg = "#1e2326", fg = "#e67e80", gui = "bold" },
    },
    replace = {
      a = { bg = "#2e383c", fg = "#d3c6aa" },
      b = { bg = "#414b50", fg = "#d3c6aa" },
      c = { bg = "#1e2326", fg = "#e69875", gui = "bold" },
    },
    command = {
      a = { bg = "#2e383c", fg = "#d3c6aa" },
      b = { bg = "#414b50", fg = "#d3c6aa" },
      c = { bg = "#1e2326", fg = "#83c092", gui = "bold" },
    },
    terminal = {
      a = { bg = "#2e383c", fg = "#d3c6aa" },
      b = { bg = "#414b50", fg = "#d3c6aa" },
      c = { bg = "#1e2326", fg = "#d699b6", gui = "bold" },
    },
    inactive = {
      a = { bg = "#2e383c", fg = "#859289" },
      b = { bg = "#2e383c", fg = "#859289" },
      c = { bg = "#2e383c", fg = "#859289" },
    },
  }
end

local config = {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {
      statusline = { "NvimTree" },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
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
  extensions = {},
}

local function insert_component(section, component)
  table.insert(section, component())
end

-- Condition to show
local function buffer_not_empty()
  return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
end

local function hide_in_width()
  return vim.fn.winwidth(0) > 80
end

-- Mode
local function provider_mode()
  local item = {
    n = { "", "#e67e80" },
    i = { "󰴓", "#a7c080" },
    v = { "", "#dbbc7f" },
    [""] = { "", "#" },
    V = { "󰈈", "#" },
    c = { "", "#" },
    no = { "", "#" },
    s = { "󰒅", "#" },
    S = { "󱊁", "#" },
    [""] = { "󰒆", "#" },
    ic = { "󰏪", "#" },
    R = { "", "#" },
    Rv = { "", "#" },
    cv = { "", "#" },
    r = { "", "#" },
    rm = { "", "#" },
    ["r?"] = { "󰹪", "#" },
    ["!"] = { "", "#" },
    t = { "", "#" },
  }
  return {
    function()
      return item[vim.fn.mode()][1]
    end,
    -- color = function()
  }
end

local function provider_filetype()
  return {
    "filetype",
    cond = buffer_not_empty,
    icon_only = true,
  }
end

local function get_filename()
  local filename = vim.fn.expand("%:r") .. "." .. vim.fn.expand("%:e") or vim.fn.expand("%:~:p")
  filename = string.gsub(filename, "\\", " > ")
  filename = string.gsub(filename, "~ > ", "")
  return filename
end

local function provider_filename()
  return {
    get_filename,
    cond = buffer_not_empty,
    color = { fg = "#dbbc7f" },
  }
end

local function provider_diagnostic()
  return {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    diagnostics_color = {
      -- Same values as the general color option can be used here.
      error = { fg = "#e67e80" }, -- Changes diagnostics' error color.
      warn = { fg = "#dbbc7f" }, -- Changes diagnostics' warn color.
      info = { fg = "#7fbbb3" }, -- Changes diagnostics' info color.
      hint = { fg = "#a7c080" }, -- Changes diagnostics' hint color.
    },
    symbols = { error = " ", warn = " ", info = " " },
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("Trouble")
        end
      end
    end,
  }
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function provider_git_diff()
  return {
    "diff",
    diff_color = {
      -- Same color values as the general color option can be used here.
      added = { fg = "#a7c080" }, -- Changes the diff's added color
      modified = { fg = "#7fbbb3" }, -- Changes the diff's modified color
      removed = { fg = "#e67e80" }, -- Changes the diff's removed color you
    },
    -- Is it me or the symbol for modified us really weird
    symbols = { added = " ", modified = "󰝤 ", removed = " " },
    source = diff_source,
    cond = hide_in_width,
  }
end

local function provider_git_branch()
  return { "branch", icon = "", color = { fg = "#e67e80" } }
end

local function provider_cursor_location()
  return { "location", cond = buffer_not_empty, color = { fg = "#d3c6aa" } }
end

local function provider_cursor_progress()
  return { "progress", cond = buffer_not_empty, color = { fg = "#d699b6" } }
end

local function LSP_message()
  local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return "No Active LSP"
  end
  local msg = {}
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and not vim.tbl_contains(msg, client.name) then
      table.insert(msg, client.name)
    end
  end

  local full_msg = table.concat(msg, "  ")
  if full_msg ~= "" then
    full_msg = " " .. full_msg
  end
  return full_msg
end

local function provider_LSP_client()
  return {
    LSP_message,
    cond = buffer_not_empty,
    color = { fg = "#e69875" },
  }
end

function Lualine.config()
  -- Left section
  local left = config.sections.lualine_c

  -- Mode
  insert_component(left, provider_mode)

  -- File
  insert_component(left, provider_filetype)
  insert_component(left, provider_filename)

  -- Right section
  local right = config.sections.lualine_x

  -- LSP
  insert_component(right, provider_diagnostic)
  insert_component(right, provider_LSP_client)

  -- Git
  insert_component(right, provider_git_diff)
  insert_component(right, provider_git_branch)

  -- Navigation
  insert_component(right, provider_cursor_location)
  insert_component(right, provider_cursor_progress)

  lualine.setup(config)
end

return Lualine
