-- Statusline
local gl = require("galaxyline")
local gls = gl.section

local colors = {
  bg = "#4C566A",
  fg = "#E5E9F0",
  section_bg = "#3B4252",
  line_bg = "#3B4252",
  red = vim.g.terminal_color_1,
  orange = vim.g.terminal_color_11,
  yellow = vim.g.terminal_color_3,
  green = vim.g.terminal_color_2,
  blue = vim.g.terminal_color_4,
  blue1 = vim.g.terminal_color_6,
  purple = vim.g.terminal_color_5,
  magenta = vim.g.terminal_color_6
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 and buffer_not_empty() then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function()
      return "▋"
    end,
    highlight = {colors.bg, colors.bg}
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local alias = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        V = "VISUAL",
        [""] = "VISUAL",
        v = "VISUAL",
        ["r?"] = ":CONFIRM",
        rm = "--MORE",
        R = "REPLACE",
        Rv = "VIRTUAL",
        s = "SELECT",
        S = "SELECT",
        ["r"] = "HIT-ENTER",
        [""] = "SELECT",
        t = "TERMINAL",
        ["!"] = "SHELL"
      }

      local mode_color = {
        n = colors.blue1,
        i = colors.blue,
        v = colors.magenta,
        [""] = colors.blue,
        V = colors.blue,
        c = colors.red,
        no = colors.magenta,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.purple,
        Rv = colors.purple,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.green,
        t = colors.green
      }

      local vim_mode = vim.fn.mode()
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim_mode])
      return alias[vim_mode] .. "  "
    end,
    highlight = {colors.bg, colors.bg, "bold"},
    separator = " ",
    separator_highlight = {colors.bg, colors.section_bg}
  }
}

gls.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.section_bg}
  }
}

gls.left[4] = {
  FileName = {
    provider = {"FileName", "FileSize"},
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.section_bg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.condition").check_git_workspace,
    highlight = {colors.red, colors.bg}
  }
}

gls.left[6] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.condition").check_git_workspace,
    highlight = {colors.fg, colors.bg, "italic"}
  }
}

gls.left[7] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.green, colors.bg}
  }
}
gls.left[8] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.orange, colors.bg}
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.red, colors.bg}
  }
}

local has_trailing_whitespace = function()
  local trail = vim.fn.search("\\s$", "nw")
  if trail ~= 0 then
    return true
  else
    return false
  end
end

local function get_nvim_lsp_diagnostic(diag_type)
  if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    return 0
  end

  local active_clients = vim.lsp.get_active_clients()

  if active_clients then
    local count = 0

    for _, client in ipairs(active_clients) do
      count = count + vim.lsp.diagnostic.get_count(vim.api.nvim_get_current_buf(), diag_type, client.id)
    end
    return count
  end
end

local has_diagnostic = function()
  local warn_count = get_nvim_lsp_diagnostic("Warning")
  local err_count = get_nvim_lsp_diagnostic("Error")
  local info_count = get_nvim_lsp_diagnostic("Information")
  local sum_diagnostic = warn_count + err_count + info_count
  if sum_diagnostic > 0 then
    return true
  else
    return false
  end
end

local has_diagnostic_or_whitespace = function()
  return has_diagnostic() or has_trailing_whitespace()
end

gls.left[10] = {
  LeftEnd = {
    provider = function()
      return ""
    end,
    condition = has_diagnostic_or_whitespace,
    highlight = {colors.section_bg, colors.bg}
  }
}

gls.left[11] = {
  TrailingWhiteSpace = {
    provider = function()
      if has_trailing_whitespace() then
        return " "
      else
        return nil
      end
    end,
    icon = "   ",
    condition = has_diagnostic_or_whitespace,
    highlight = {colors.yellow, colors.section_bg}
  }
}

gls.left[12] = {
  Space = {
    provider = function()
      return " "
    end,
    condition = has_diagnostic_or_whitespace,
    highlight = {colors.section_bg, colors.section_bg}
  }
}

gls.left[13] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    condition = has_diagnostic_or_whitespace,
    icon = "  ",
    highlight = {colors.red, colors.section_bg}
  }
}

gls.left[14] = {
  Space = {
    provider = function()
      return " "
    end,
    condition = has_diagnostic_or_whitespace,
    highlight = {colors.section_bg, colors.section_bg}
  }
}

gls.left[15] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    condition = has_diagnostic_or_whitespace,
    icon = "  ",
    highlight = {colors.orange, colors.section_bg}
  }
}

gls.left[16] = {
  Space = {
    provider = function()
      return " "
    end,
    condition = has_diagnostic_or_whitespace,
    highlight = {colors.section_bg, colors.section_bg}
  }
}

gls.left[17] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    condition = has_diagnostic_or_whitespace,
    icon = " 🗱 ",
    highlight = {colors.blue, colors.section_bg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

function get_lsp_message()
  if #vim.lsp.buf_get_clients() == 0 then
    return ""
  end

  local messages = require("lsp-status/messaging").messages
  local buf_messages = messages()
  local aliases = {
    pyls_ms = "MPLS"
  }
  local spinner_frames = {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"}
  local contents = ""
  for _, msg in ipairs(buf_messages) do
    local name = aliases[msg.name] or msg.name
    local client_name = "[" .. name .. "]"
    if msg.progress then
      contents = msg.title
      if msg.message then
        contents = contents .. " " .. msg.message
      end

      if msg.percentage then
        contents = contents .. " (" .. msg.percentage .. ")"
      end

      if msg.spinner then
        contents = spinner_frames[(msg.spinner % #spinner_frames) + 1] .. " " .. contents
      end
    elseif msg.status then
      contents = msg.content
      if msg.uri then
        local filename = vim.uri_to_fname(msg.uri)
        filename = vim.fn.fnamemodify(filename, ":~:.")
        local space = math.min(60, math.floor(0.6 * vim.fn.winwidth(0)))
        if #filename > space then
          filename = vim.fn.pathshorten(filename)
        end

        contents = "(" .. filename .. ") " .. contents
      end
    else
      contents = msg.content
    end

    contents = client_name .. " " .. contents
  end
  local current_function = vim.b.lsp_current_function
  if current_function and current_function ~= "" then
    contents = current_function .. " " .. contents
  end

  if contents ~= "" then
    return contents
  end

  return ""
end

gls.left[18] = {
  LspFunc = {
    provider = get_lsp_message,
    condition = buffer_not_empty,
    icon = "  ",
    highlight = {colors.yellow, colors.bg, "italic"}
  }
}

gls.right[1] = {
  RightStart = {
    provider = function()
      return " "
    end,
    condition = buffer_not_empty,
    highlight = {colors.section_bg, colors.section_bg},
    separator = "",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

gls.right[2] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.section_bg}
  }
}
gls.right[3] = {
  FileFormat = {
    provider = function()
      return vim.bo.filetype:gsub("^%l", string.upper)
    end,
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.section_bg, "bold"}
  }
}
gls.right[4] = {
  LineInfo = {
    provider = "LineColumn",
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.section_bg},
    separator = "  ",
    separator_highlight = {colors.line_bg, colors.section_bg}
  }
}

gls.right[5] = {
  PerCent = {
    provider = "LinePercent",
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.section_bg, "bold"},
    separator = " ",
    separator_highlight = {colors.line_bg, colors.section_bg}
  }
}

gls.right[6] = {
  Heart = {
    provider = function()
      return "🔥 "
    end,
    condition = buffer_not_empty,
    highlight = {colors.red, colors.section_bg},
    separator = " ",
    separator_highlight = {colors.line_bg, colors.section_bg, "bold"}
  }
}

-- Short status line
gls.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.section_bg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

gls.short_line_right[2] = {
  BufferIcon = {
    provider = "BufferIcon",
    condition = buffer_not_empty,
    highlight = {colors.yellow, colors.section_bg}
  }
}
