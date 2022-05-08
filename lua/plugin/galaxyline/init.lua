local fn = vim.fn
local line = require("galaxyline")
local condition = require("galaxyline.condition")
local fileinfo = require("galaxyline.providers.fileinfo")

local function buffer_not_empty()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  else
    return false
  end
end

local icons = {
  slant = {
    right = " ",
    left = " ",
  },
  diagnostic = {
    ok = "",
    error = "",
    warn = "",
    info = "",
    hint = "",
  },
  git = {
    branch = "",
    add = "",
    modified = "",
    remove = "",
  },
}

local custom_statusline_color = {
  colors = {
    background = "#F2A60D",
    foreground = "#1b1f24",
  },
}

local item_highlight = { custom_statusline_color.colors.foreground, custom_statusline_color.colors.background, "bold" }

local mode_color = function()
  local mode_colors = {
    n = custom_statusline_color.colors.foreground,
    i = custom_statusline_color.colors.foreground,
    c = custom_statusline_color.colors.foreground,
    V = custom_statusline_color.colors.foreground,
    [""] = custom_statusline_color.colors.foreground,
    v = custom_statusline_color.colors.foreground,
    s = custom_statusline_color.colors.foreground,
    S = custom_statusline_color.colors.foreground,
    [""] = custom_statusline_color.colors.foreground,
    R = custom_statusline_color.colors.foreground,
    r = custom_statusline_color.colors.foreground,
    ["!"] = custom_statusline_color.colors.foreground,
    t = custom_statusline_color.colors.foreground,
  }

  return mode_colors[fn.mode()]
end

local Galaxy = {}

local function left_config()
  local left = line.section.left
  left[1] = {
    ViMode = {
      provider = function()
        local alias = {
          n = "Ⓝ ",
          i = "Ⓘ ",
          c = "Ⓒ ",
          V = "Ⓥ ",
          [""] = "Ⓥ ",
          v = "Ⓥ ",
          s = "Ⓢ ",
          S = "Ⓢ ",
          [""] = "Ⓢ ",
          R = "Ⓡ ",
          r = "Ⓡ ",
          ["!"] = "𥉉 ",
          t = "Ⓣ ",
        }
        local color = mode_color()
        if color ~= nil then
          vim.api.nvim_set_hl(
            0,
            "GalaxyViMode",
            { bg = custom_statusline_color.colors.background, fg = color, bold = true }
          )
          return "  " .. alias[fn.mode()]
        end
        return ""
      end,
      highlight = { custom_statusline_color.colors.background, custom_statusline_color.colors.background },
      separator = icons.slant.left,
      separator_highlight = {
        custom_statusline_color.colors.background,
        custom_statusline_color.colors.background,
      },
    },
  }
  left[2] = {
    DiagnosticError = {
      provider = "DiagnosticError",
      icon = icons.diagnostic.error .. " ",
      highlight = item_highlight,
    },
  }
  left[3] = {
    DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = icons.diagnostic.warn .. " ",
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
  left[4] = {
    DiagnosticInfo = {
      provider = "DiagnosticInfo",
      icon = icons.diagnostic.info .. " ",
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
  left[5] = {
    DiagnosticHint = {
      provider = "DiagnosticHint",
      icon = icons.diagnostic.hint .. " ",
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
  left[6] = {
    FileIcon = {
      provider = "FileIcon",
      condition = buffer_not_empty,
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
  left[7] = {
    FileName = {
      provider = function()
        local fullname = fn.fnamemodify(fn.getcwd(), ":t") .. "\\" .. fn.expand("%:F")
        local shortname = fileinfo.get_current_file_name()
        return string.len(fullname) > 40 and shortname or fullname
      end,
      condition = buffer_not_empty,
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
      separator = icons.slant.right,
      separator_highlight = {
        custom_statusline_color.colors.background,
        custom_statusline_color.colors.background,
      },
    },
  }
  left[8] = {
    LspStatus = {
      provider = function()
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return "No Active LSP"
        end
        local msg = {}
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and fn.index(filetypes, buf_ft) ~= -1 and not vim.tbl_contains(msg, client.name) then
            table.insert(msg, client.name)
          end
        end

        local full_msg = table.concat(msg, "  ")
        if full_msg ~= "" then
          full_msg = " " .. full_msg
        end
        return full_msg
      end,
      condition = function()
        local tbl = { ["dashboard"] = true, [""] = true }
        if tbl[vim.bo.filetype] then
          return false
        end
        return true
      end,
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
      },
    },
  }
end

local function right_config()
  local right = line.section.right
  right[1] = {
    GitBranch = {
      provider = "GitBranch",
      condition = condition.check_git_workspace,
      icon = icons.git.branch .. " ",
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
  right[2] = {
    Space = {
      provider = function()
        return " "
      end,
      highlight = { custom_statusline_color.colors.background, custom_statusline_color.colors.background },
    },
  }
  right[3] = {
    DiffAdd = {
      provider = "DiffAdd",
      condition = condition.hide_in_width,
      icon = icons.git.add .. " ",
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
  right[4] = {
    DiffModified = {
      provider = "DiffModified",
      condition = condition.hide_in_width,
      icon = icons.git.modified .. " ",
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
  right[5] = {
    DiffRemove = {
      provider = "DiffRemove",
      condition = condition.hide_in_width,
      icon = icons.git.remove .. " ",
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
  right[6] = {
    LineColumn = {
      provider = "LineColumn",
      condition = buffer_not_empty,
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
  right[7] = {
    LinePercent = {
      provider = "LinePercent",
      condition = buffer_not_empty,
      highlight = {
        custom_statusline_color.colors.foreground,
        custom_statusline_color.colors.background,
        "bold",
      },
    },
  }
end

function Galaxy.config()
  line.short_line_list = { "DiffviewFiles", "NvimTree", "Outline", "packer" }
  left_config()
  right_config()

  -- Custom highlight
  local statusline_hl_ns = vim.api.nvim_create_namespace("StatusLineHightlight")
  vim.api.nvim_set_hl(
    statusline_hl_ns,
    "StatusLine",
    { bg = custom_statusline_color.colors.background, fg = custom_statusline_color.colors.background }
  )
  vim.api.nvim_set_hl(
    statusline_hl_ns,
    "StatusLineNC",
    { bg = custom_statusline_color.colors.foreground, fg = custom_statusline_color.colors.foreground }
  )
end

return Galaxy
