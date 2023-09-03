local lualine = require("lualine")

local Lualine = {}

local function insert_component(section, component)
  table.insert(section, component())
end

function Lualine.config()
  local colors = {
    red = "#ff1818",
    light_cyan = "#caece6",
    blue = "#03c6e3",
    green = "#39FF13",
    cyan = "#05eeff",
    orange = "#ff6700",
    yellow = "#ccff00",
    light_purple = "#a599e9",
    purple = "#bc13fe",
    magenta = "#ea00ff",
  }

  local config = {
    options = {
      icons_enabled = true,
      theme = "auto",
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

  -- Condition to show
  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
  }

  -- Left section
  local left = config.sections.lualine_c

  -- Mode
  insert_component(left, function()
    local item = {
      n = { "", colors.red },
      i = { "󰴓", colors.green },
      v = { "", colors.blue },
      [""] = { "", colors.blue },
      V = { "󰈈", colors.blue },
      c = { "", colors.magenta },
      no = { "", colors.red },
      s = { "󰒅", colors.orange },
      S = { "󱊁", colors.orange },
      [""] = { "󰒆", colors.orange },
      ic = { "󰏪", colors.yellow },
      R = { "", colors.purple },
      Rv = { "", colors.purple },
      cv = { "", colors.red },
      c = { "", colors.red },
      r = { "", colors.cyan },
      rm = { "", colors.cyan },
      ["r?"] = { "󰹪", colors.cyan },
      ["!"] = { "", colors.red },
      t = { "", colors.red },
    }
    return {
      function()
        return item[vim.fn.mode()][1]
      end,
      color = function()
        return { fg = item[vim.fn.mode()][2] }
      end,
    }
  end)

  -- File
  insert_component(left, function()
    return {
      "filetype",
      cond = conditions.buffer_not_empty,
      icon_only = true,
    }
  end)
  insert_component(left, function()
    return {
      function()
        local filename = vim.fn.expand("%:~:p")
        filename = string.gsub(filename, "\\", " > ")
        filename = string.gsub(filename, "~ > ", "")
        return filename
      end,
      cond = conditions.buffer_not_empty,
      color = { fg = colors.cyan },
    }
  end)

  -- Right section
  local right = config.sections.lualine_x

  -- LSP
  insert_component(right, function()
    return {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
    }
  end)
  insert_component(right, function()
    return {
      function()
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
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
      end,
      color = { fg = colors.yellow },
      cond = conditions.buffer_not_empty,
    }
  end)

  -- Git
  insert_component(right, function()
    return {
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = { added = " ", modified = "󰝤 ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    }
  end)
  insert_component(right, function()
    return { "branch", icon = "", color = { fg = colors.cyan } }
  end)

  -- Navigation
  insert_component(right, function()
    return { "location", colors = { fg = colors.purple }, cond = conditions.buffer_not_empty }
  end)
  insert_component(right, function()
    return { "progress", color = { fg = colors.magenta }, cond = conditions.buffer_not_empty }
  end)

  lualine.setup(config)
end

return Lualine
