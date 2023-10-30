local lualine = require("lualine")
local cmake = require("cmake-tools")

local Lualine = {}

local function theme()
  return {
    normal = {
      c = { fg = "#4e5a64", bg = "#d6deeb" },
      x = { fg = "#4e5a64", bg = "#d6deeb" },
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
    n = { "" },
    i = { "󰴓" },
    v = { "" },
    [""] = { "" },
    V = { "󰈈" },
    c = { "" },
    no = { "" },
    s = { "󰒅" },
    S = { "󱊁" },
    [""] = { "󰒆" },
    ic = { "󰏪" },
    R = { "" },
    Rv = { "" },
    cv = { "" },
    r = { "" },
    rm = { "" },
    ["r?"] = { "󰹪" },
    ["!"] = { "" },
    t = { "" },
  }
  return {
    function()
      return item[vim.fn.mode()][1]
    end,
  }
end

local function provider_filetype()
  return {
    "filetype",
    cond = buffer_not_empty,
    colored = false,
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
  }
end

local function cmake_preset_and_buf_not_empty()
  return cmake.has_cmake_preset() and buffer_not_empty()
end

local function get_configure_preset()
  local c_preset = cmake.get_configure_preset()
  return "CMake: [" .. (c_preset and c_preset or "✘") .. "]"
end

local function provider_cmake_select_configure_preset()
  return {
    get_configure_preset,
    icon = { "" },
    cond = cmake_preset_and_buf_not_empty,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectConfigurePreset")
        end
      end
    end,
  }
end

local function cmake_not_preset_and_buf_not_empty()
  return not cmake.has_cmake_preset() and buffer_not_empty()
end

local function get_build_type()
  local type = cmake.get_build_type()
  return "CMake: [" .. (type and type or "") .. "]"
end

local function provider_cmake_select_build_type()
  return {
    get_build_type,
    icon = { "" },
    cond = cmake_not_preset_and_buf_not_empty,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectBuildType")
        end
      end
    end,
  }
end

local function get_kit()
  local kit = cmake.get_kit()
  return "[" .. (kit and kit or "✘") .. "]"
end

local function provider_cmake_select_kit()
  return {
    get_kit,
    icon = { "󰺾" },
    cond = function()
      return cmake_not_preset_and_buf_not_empty
    end,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectKit")
        end
      end
    end,
  }
end

local function provider_cmake_build()
  return {
    function()
      return "Build"
    end,
    icon = { "" },
    cond = buffer_not_empty,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeBuild")
        end
      end
    end,
  }
end

local function get_build_preset()
  local b_preset = cmake.get_build_preset()
  return "[" .. (b_preset and b_preset or "✘") .. "]"
end

local function provider_cmake_select_build_preset()
  return {
    get_build_preset,
    icon = { "" },
    cond = cmake_preset_and_buf_not_empty,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectBuildPreset")
        end
      end
    end,
  }
end

local function provider_cmake_debug()
  return {
    function()
      return " "
    end,
    cond = buffer_not_empty,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeDebug")
        end
      end
    end,
  }
end

local function provider_cmake_run()
  return {
    function()
      return "󰜎"
    end,
    cond = buffer_not_empty,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeRun")
        end
      end
    end,
  }
end

local function get_launch_target()
  local l_target = cmake.get_launch_target()
  return "[" .. (l_target and l_target or "X") .. "]"
end

local function provider_cmake_select_launch_target()
  return {
    get_launch_target,
    cond = buffer_not_empty,
    on_click = function(n, mouse)
      if n == 1 then
        if mouse == "l" then
          vim.cmd("CMakeSelectLaunchTarget")
        end
      end
    end,
  }
end

local function provider_diagnostic()
  return {
    "diagnostics",
    colored = false,
    sources = { "nvim_diagnostic" },
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

local function provider_git_diff()
  return {
    "diff",
    colored = false,
    -- Is it me or the symbol for modified us really weird
    symbols = { added = " ", modified = "󰝤 ", removed = " " },

    cond = hide_in_width,
  }
end

local function provider_git_branch()
  return { "branch", icon = "" }
end

local function provider_cursor_location()
  return { "location", cond = buffer_not_empty }
end

local function provider_cursor_progress()
  return { "progress", cond = buffer_not_empty }
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

  -- Civitasv/cmake-tools.nvim
  if cmake.is_cmake_project() then
    insert_component(left, provider_cmake_select_configure_preset)
    insert_component(left, provider_cmake_select_build_type)
    insert_component(left, provider_cmake_select_kit)
    insert_component(left, provider_cmake_build)
    insert_component(left, provider_cmake_select_build_preset)
    insert_component(left, provider_cmake_debug)
    insert_component(left, provider_cmake_run)
    insert_component(left, provider_cmake_select_launch_target)
  end

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
