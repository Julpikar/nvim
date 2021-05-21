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

local sonokai = {
  colors = {
    dark = "#282828",
    cyan = "#85d3f2",
    white = "#e2e2e3",
    red = "#fc5d7c",
    orange = "#f39660",
    yellow = "#e7c664",
    green = "#9ed072",
    blue = "#76cce0",
    purple = "#b39df3",
    grey = "#7f8490"
  }
}

local mode_color = function()
  local mode_colors = {
    n = sonokai.colors.white,
    i = sonokai.colors.red,
    c = sonokai.colors.yellow,
    V = sonokai.colors.cyan,
    [""] = sonokai.colors.yellow,
    v = sonokai.colors.cyan,
    s = sonokai.colors.orange,
    S = sonokai.colors.orange,
    [""] = sonokai.colors.orange,
    R = sonokai.colors.yellow,
    r = sonokai.colors.yellow,
    ["!"] = sonokai.colors.cyan,
    t = sonokai.colors.blue
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
      highlight = {sonokai.colors.dark, sonokai.colors.dark},
      separator = icons.slant.left,
      separator_highlight = {sonokai.colors.dark, sonokai.colors.dark}
    }
  }
  left[2] = {
    FileIcon = {
      provider = fileinfo.get_file_icon,
      condition = condition.buffer_not_empty,
      highlight = {fileinfo.get_file_icon_color, sonokai.colors.dark}
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
      highlight = {fileinfo.get_file_icon_color, sonokai.colors.dark},
      separator = icons.slant.right,
      separator_highlight = {sonokai.colors.dark, sonokai.colors.dark}
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
      highlight = {sonokai.colors.grey, sonokai.colors.dark}
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
      highlight = {sonokai.colors.red, sonokai.colors.dark, "bold"}
    }
  }
  right[2] = {
    Space = {
      provider = function()
        return " "
      end,
      highlight = {sonokai.colors.dark, sonokai.colors.dark}
    }
  }
  right[3] = {
    DiffAdd = {
      provider = vcs.diff_add,
      condition = condition.hide_in_width,
      icon = icons.git.add .. " ",
      highlight = {sonokai.colors.green, sonokai.colors.dark}
    }
  }
  right[4] = {
    DiffModified = {
      provider = vcs.diff_modified,
      condition = condition.hide_in_width,
      icon = icons.git.modified .. " ",
      highlight = {sonokai.colors.yellow, sonokai.colors.dark}
    }
  }
  right[5] = {
    DiffRemove = {
      provider = vcs.diff_remove,
      condition = condition.hide_in_width,
      icon = icons.git.remove .. " ",
      highlight = {sonokai.colors.red, sonokai.colors.dark}
    }
  }
  right[6] = {
    LineColumn = {
      provider = fileinfo.line_column,
      condition = condition.buffer_not_empty,
      highlight = {sonokai.colors.blue, sonokai.colors.dark}
    }
  }
  right[7] = {
    LinePercent = {
      provider = fileinfo.current_line_percent,
      condition = condition.buffer_not_empty,
      highlight = {sonokai.colors.white, sonokai.colors.dark}
    }
  }
  right[8] = {
    DiagnosticError = {
      provider = diagnostic.get_diagnostic_error,
      icon = icons.diagnostic.error .. " ",
      highlight = {sonokai.colors.red, sonokai.colors.dark}
    }
  }
  right[9] = {
    DiagnosticWarn = {
      provider = diagnostic.get_diagnostic_warn,
      icon = icons.diagnostic.warn .. " ",
      highlight = {sonokai.colors.yellow, sonokai.colors.dark}
    }
  }
  right[10] = {
    DiagnosticInfo = {
      provider = diagnostic.get_diagnostic_info,
      icon = icons.diagnostic.info .. " ",
      highlight = {sonokai.colors.green, sonokai.colors.dark}
    }
  }
  right[11] = {
    DiagnosticHint = {
      provider = diagnostic.get_diagnostic_hint,
      icon = icons.diagnostic.hint .. " ",
      highlight = {sonokai.colors.orange, sonokai.colors.dark}
    }
  }
end

function Galaxy.config()
  line.short_line_list = {"NvimTree", "Vista", "packer"}
  left_config()
  right_config()
  cmd("highlight! StatusLine guibg=" .. sonokai.colors.dark .. " guifg=" .. sonokai.colors.dark)
  cmd("highlight! StatusLineNC guibg=" .. sonokai.colors.dark .. " guifg=" .. sonokai.colors.dark)
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
