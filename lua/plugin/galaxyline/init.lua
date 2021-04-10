local line = require("galaxyline")
local diagnostic = require("galaxyline.provider_diagnostic")
local vcs = require("galaxyline.provider_vcs")
local fileinfo = require("galaxyline.provider_fileinfo")
local condition = require("galaxyline.condition")

local fn = vim.fn
local cmd = vim.cmd

local icons = {
  slant = {
    right = " ",
    left = " "
  },
  diagnostic = {
    ok = "",
    error = "",
    warn = "",
    info = "",
    hint = ""
  },
  diff = {
    add = "",
    modified = "",
    remove = ""
  },
  git = ""
}

local colors = {
  bg = "#202328",
  line_bg = "#1a1c1d",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67"
}

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [""] = colors.magenta,
    v = colors.magenta,
    R = colors.red
  }

  return mode_colors[vim.fn.mode()]
end

local Galaxy = {}

local function left_config()
  local left = line.section.left
  left[1] = {
    Logo = {
      provider = function()
        return "   "
      end,
      highlight = {colors.line_bg, colors.cyan}
    }
  }
  left[2] = {
    ViMode = {
      provider = function()
        local alias = {
          n = "Ⓝ ",
          i = "Ⓘ ",
          c = "Ⓒ",
          V = "Ⓥ ",
          [""] = "Ⓥ ",
          v = "Ⓥ ",
          R = "Ⓡ "
        }
        vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color() .. " gui=bold")
        return "  " .. alias[vim.fn.mode()]
      end,
      highlight = {colors.line_bg, colors.orange},
      separator = icons.slant.left,
      separator_highlight = {colors.line_bg, colors.line_bg}
    }
  }
  left[3] = {
    FileIcon = {
      provider = fileinfo.get_file_icon,
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, colors.line_bg}
    }
  }
  left[4] = {
    FileName = {
      provider = function()
        return fn.expand("%:F")
      end,
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, colors.line_bg}
    }
  }
  left[5] = {
    DiagnosticError = {
      provider = diagnostic.get_diagnostic_error,
      icon = icons.diagnostic.error .. " ",
      highlight = {colors.red, colors.line_bg},
      separator = " ",
      separator_highlight = {colors.line_bg, colors.line_bg}
    }
  }
  left[6] = {
    DiagnosticWarn = {
      provider = diagnostic.get_diagnostic_warn,
      icon = icons.diagnostic.warn .. " ",
      highlight = {colors.yellow, colors.line_bg}
    }
  }
  left[7] = {
    DiagnosticInfo = {
      provider = diagnostic.get_diagnostic_info,
      icon = icons.diagnostic.info .. " ",
      highlight = {colors.green, colors.line_bg}
    }
  }
  left[8] = {
    DiagnosticHint = {
      provider = diagnostic.get_diagnostic_hint,
      icon = icons.diagnostic.hint .. " ",
      highlight = {colors.blue, colors.line_bg}
    }
  }
end

local function mid_config()
  local lsp_status = require("lsp-status")
  local mid = line.section.mid
  mid[1] = {
    LspStatus = {
      provider = lsp_status.status,
      highlight = {colors.orange, colors.line_bg}
    }
  }
end

local function right_config()
  local right = line.section.right
  right[1] = {
    GitBranch = {
      provider = vcs.get_git_branch,
      condition = condition.check_git_workspace,
      icon = " ",
      highlight = {colors.orange, colors.line_bg, "bold"}
    }
  }
  right[2] = {
    DiffAdd = {
      provider = vcs.diff_add,
      condition = condition.hide_in_width,
      icon = icons.diff.add .. " ",
      highlight = {colors.green, colors.line_bg}
    }
  }
  right[3] = {
    DiffModified = {
      provider = vcs.diff_modified,
      condition = condition.hide_in_width,
      icon = icons.diff.modified .. " ",
      highlight = {colors.yellow, colors.line_bg}
    }
  }
  right[4] = {
    DiffRemove = {
      provider = vcs.diff_remove,
      condition = condition.hide_in_width,
      icon = icons.diff.remove .. " ",
      highlight = {colors.red, colors.line_bg}
    }
  }
  right[5] = {
    LineColumn = {
      provider = fileinfo.line_column,
      condition = condition.buffer_not_empty,
      highlight = {colors.cyan, colors.line_bg}
    }
  }
  right[6] = {
    LinePercent = {
      provider = fileinfo.current_line_percent,
      condition = condition.buffer_not_empty,
      highlight = {colors.yellow, colors.line_bg}
    }
  }
end

function Galaxy.config()
  cmd("hi StatusLine guibg=" .. colors.line_bg .. " guifg=" .. colors.line_bg)
  line.short_line_list = {"NvimTree", "vista", "packer"}
  left_config()
  mid_config()
  right_config()
end

local metatable = {
  __call = function()
    local self = {}
    setmetatable(self, {__index = Galaxy})
    return self
  end
}
setmetatable(Galaxy, metatable)

return Galaxy
