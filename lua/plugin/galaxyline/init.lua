local line = require("galaxyline")
local diagnostic = require("galaxyline.provider_diagnostic")
local vcs = require("galaxyline.provider_vcs")
local fileinfo = require("galaxyline.provider_fileinfo")
local condition = require("galaxyline.condition")
local lspclient = require("galaxyline.provider_lsp")

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
  git = {
    branch = "",
    add = "",
    modified = "",
    remove = ""
  }
}

local gruvbox = {
  default_fg = "#ebdbb2",
  default_bg = "#3c3836",
  colors = {
    fore = "#504945",
    back = "#928374",
    dark = "#282828",
    white = "#fbf1c7",
    skyblue = "#458588",
    cyan = "#89b482",
    green = "#b8bb26",
    oceanblue = "#83a598",
    magenta = "#c14a4a",
    orange = "#d65d0e",
    red = "#ea6962",
    violet = "#d3869b",
    yellow = "#fabd2f"
  }
}

local mode_color = function()
  local mode_colors = {
    n = gruvbox.colors.back,
    i = gruvbox.colors.skyblue,
    c = gruvbox.colors.yellow,
    V = gruvbox.colors.cyan,
    [""] = gruvbox.colors.yellow,
    v = gruvbox.colors.cyan,
    s = gruvbox.colors.magenta,
    S = gruvbox.colors.magenta,
    [""] = gruvbox.colors.magenta,
    R = gruvbox.colors.yellow,
    r = gruvbox.colors.yellow,
    ["!"] = gruvbox.colors.cyan,
    t = gruvbox.colors.skyblue
  }

  return mode_colors[vim.fn.mode()]
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
          t = "Ⓣ "
        }
        local color = mode_color()
        if color ~= nil then
          vim.api.nvim_command("hi GalaxyViMode guifg=" .. color .. " gui=bold")
          return "  " .. alias[vim.fn.mode()]
        end
        return ""
      end,
      highlight = {gruvbox.colors.dark, gruvbox.colors.dark},
      separator = icons.slant.left,
      separator_highlight = {gruvbox.colors.dark, gruvbox.colors.dark}
    }
  }
  left[2] = {
    FileIcon = {
      provider = fileinfo.get_file_icon,
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, gruvbox.colors.dark}
    }
  }
  left[3] = {
    FileName = {
      provider = function()
        local fullname = fn.expand("%:F")
        local shortname = fileinfo.get_current_file_name()
        return string.len(fullname) > 40 and shortname or fullname
      end,
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, gruvbox.colors.dark},
      separator = icons.slant.right,
      separator_highlight = {gruvbox.colors.dark, gruvbox.colors.dark}
    }
  }
  left[4] = {
    LspStatus = {
      provider = function()
        local lsp_status = require("lsp-status")
        local status = lsp_status.status()
        local server_name = lspclient.get_lsp_client()
        return string.len(status) < 5 and " " .. server_name or status
      end,
      condition = condition.buffer_not_empty,
      highlight = {gruvbox.colors.back, gruvbox.colors.dark}
    }
  }
end

local function right_config()
  local right = line.section.right
  right[1] = {
    GitBranch = {
      provider = vcs.get_git_branch,
      condition = condition.check_git_workspace,
      icon = icons.git.branch .. " ",
      highlight = {gruvbox.colors.red, gruvbox.colors.dark, "bold"}
    }
  }
  right[2] = {
    Space = {
      provider = function()
        return " "
      end,
      highlight = {gruvbox.colors.dark, gruvbox.colors.dark}
    }
  }
  right[3] = {
    DiffAdd = {
      provider = vcs.diff_add,
      condition = condition.hide_in_width,
      icon = icons.git.add .. " ",
      highlight = {gruvbox.colors.green, gruvbox.colors.dark}
    }
  }
  right[4] = {
    DiffModified = {
      provider = vcs.diff_modified,
      condition = condition.hide_in_width,
      icon = icons.git.modified .. " ",
      highlight = {gruvbox.colors.yellow, gruvbox.colors.dark}
    }
  }
  right[5] = {
    DiffRemove = {
      provider = vcs.diff_remove,
      condition = condition.hide_in_width,
      icon = icons.git.remove .. " ",
      highlight = {gruvbox.colors.red, gruvbox.colors.dark}
    }
  }
  right[6] = {
    LineColumn = {
      provider = fileinfo.line_column,
      condition = condition.buffer_not_empty,
      highlight = {gruvbox.colors.oceanblue, gruvbox.colors.dark}
    }
  }
  right[7] = {
    LinePercent = {
      provider = fileinfo.current_line_percent,
      condition = condition.buffer_not_empty,
      highlight = {gruvbox.colors.white, gruvbox.colors.dark}
    }
  }
  right[8] = {
    DiagnosticError = {
      provider = diagnostic.get_diagnostic_error,
      icon = icons.diagnostic.error .. " ",
      highlight = {gruvbox.colors.red, gruvbox.colors.dark}
    }
  }
  right[9] = {
    DiagnosticWarn = {
      provider = diagnostic.get_diagnostic_warn,
      icon = icons.diagnostic.warn .. " ",
      highlight = {gruvbox.colors.yellow, gruvbox.colors.dark}
    }
  }
  right[10] = {
    DiagnosticInfo = {
      provider = diagnostic.get_diagnostic_info,
      icon = icons.diagnostic.info .. " ",
      highlight = {gruvbox.colors.green, gruvbox.colors.dark}
    }
  }
  right[11] = {
    DiagnosticHint = {
      provider = diagnostic.get_diagnostic_hint,
      icon = icons.diagnostic.hint .. " ",
      highlight = {gruvbox.colors.skyblue, gruvbox.colors.dark}
    }
  }
end

function Galaxy.config()
  line.short_line_list = {"NvimTree", "Vista", "packer"}
  left_config()
  right_config()
  cmd("hi! StatusLine guibg=" .. gruvbox.colors.dark .. " guifg=" .. gruvbox.colors.dark)
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
